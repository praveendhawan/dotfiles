if [ -x "$(command -v docker)" ]; then
# GLOBAL VARIABLES
  BASE_DOCKER_COMPOSE_COMMAND="docker compose -f docker-compose.yml --env-file .env --env-file .my_env"
  DOCKER_RAILS_COMMAND="$BASE_DOCKER_COMPOSE_COMMAND exec -e COLUMNS=jd_stty_cols -e LINES=jd_stty_rows rails"
  DOCKER_SPRING_COMMAND="$BASE_DOCKER_COMPOSE_COMMAND exec -e COLUMNS=jd_stty_cols -e LINES=jd_stty_rows spring"

# BASE ALIAS
  alias dc="$BASE_DOCKER_COMPOSE_COMMAND"

# Functions

# Attach to process running inside docker container
  function jd_attach() {
    attach_to=$1
    docker attach $(docker ps | grep $attach_to | tr -s " " | cut -d " " -f 1)
  }

# Docker attach or exec console's height and width
  function jd_stty_rows {
    tput lines
  }

  function jd_stty_cols {
    tput cols
  }

# Running Rubocop for code changes
  function run_rubo_bc() {
    dc run --rm rails bash -c -l "git ls-files -m | xargs ls -1 2>/dev/null | grep '\.rb$' | xargs bundle exec rubocop"
  }

  function run_rubo_ac() {
    dc run --rm rails bash -c -l "git diff-tree -r --no-commit-id --name-only head origin/master | xargs bundle exec rubocop"
  }

# Running Feature specs
  function jd_fspec() {
    spec_file=${1:-""}
    mobile_only=${2:-"FEATURES_DESKTOP=yes"}
    dc run --rm -p 5900:5900 rails bash -c -l "FEATURES_HEADED=yes FEATURES_RESKINNED=yes $mobile_only bin/scripts/run_features.sh $spec_file"
  }

# Running Migrations/Rollbacks
# Running ROllback
  function run_rollback() {
    echo "Running Rollback for Dev Environment"
    dc exec spring bundle exec rails db:rollback

    echo "Running Rollback for Test Environment"
    dc exec spring bundle exec rails db:rollback RAILS_ENV=test
  }

# Running Migrations
  function run_migrations() {
    checkout_changes=true
    if git status --porcelain | grep db/; then
      checkout_changes=false
    fi

    echo "Running Migrations for Dev Environment"
    dc exec spring bundle exec spring rails db:migrate

    echo "Now Running migrations for Test Env"
    dc exec spring bundle exec spring rails db:migrate RAILS_ENV=test

    if $checkout_changes; then
      echo "checking out db/structure.sql changes"
      git co db/structure.sql
    else
      echo "not checking out structure file changes as we have added migrations"
    fi
  }

# build, upload and deploy to stack mentioned in argument
# Build Upload and Deploy
  function jd_deploy() {
    echo "Stopiing containers for deploy"
    dc stop rails webpacker sidekiq kibana spring
    source ~/.jiffy-deploy-env

    echo " delete hard sources"
    dc run --rm webpacker bash -l -c "rm -rf node_modules/.cache/hard-source"

    echo "start deploy"
    dc run --rm \
      -e AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID \
      -e AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY \
      -e AWS_REGION=$AWS_REGION \
      -e DEPLOY_BUCKET=$DEPLOY_BUCKET \
      -e PACKAGE_FOLDER=$PACKAGE_FOLDER \
      rails bash -l -c "./bin/deploy.sh $1"

    echo "Running yarn install"
    dc run --rm webpacker yarn install

    echo "Starting containers back up"
    dc start rails webpacker sidekiq kibana spring
  }

# Run any Code in Docker Ruby
  function run_in_docker() {
   ruby_version=$1

   docker run --rm -it -v ${PWD}:/home/app ruby:$ruby_version bash
  }

# Get IP of any AWS EC2 instance of stack
  function jiffy_ip() {
    stack=${1:-"jakku"}
    layer=${2:-"rails"}

    if [ $layer = "sidekiq" ]
    then
      stack_layer="opsworks:layer:sidekiq"
    else
      stack_layer="opsworks:layer:rails-app"
    fi

    aws ec2 describe-instances --filters "Name=tag:opsworks:stack,Values=$stack" "Name=tag-key,Values=$stack_layer" --query "Reservations[].Instances[].PublicDnsName" --output text
  }

  function jiffy_travis_download() {
    build_number=${1}
    rm -f ${PWD}/tmp/screenshots/screenshots/*.html
    rm -f ${PWD}/tmp/screenshots/screenshots/*.png
    aws s3 cp s3://jiffy-github-ci-artifacts/artifacts/$build_number ${PWD}/tmp/screenshots/ --recursive
  }

# Aliases
  alias jd_be="$DOCKER_SPRING_COMMAND bundle exec"
  alias jd_bi="$DOCKER_SPRING_COMMAND bundle"
  alias jd_rails_bash="$DOCKER_RAILS_COMMAND bash"
  alias jd_rails_c="$DOCKER_SPRING_COMMAND bundle exec spring rails c"
  alias jd_attach_rails="jd_attach rails"
  alias jd_rspec="$DOCKER_SPRING_COMMAND bundle exec spring rspec"
  alias jd_postgres="$BASE_DOCKER_COMPOSE_COMMAND exec postgres psql -U postgres -d jiffyshirts_development"
  alias jd_rubo="$DOCKER_SPRING_COMMAND bundle exec rubocop -a"
  alias jd_setup_fspec="$DOCKER_RAILS_COMMAND bash -l -c \"bundle exec bin/scripts/setup_features.sh\""
  alias jd_update_db="$DOCKER_SPRING_COMMAND bundle exec spring rails db:bootstrap_jiffy REINDEX=false DOWNLOAD=true RESET_SCHEMA=true"

  alias jd_rubo_ac="run_rubo_ac"
  alias jd_rubo_bc="run_rubo_bc"

  alias jd_migrate="run_migrations"

  alias jd_rollback="run_rollback"

  alias dps_pretty="docker ps -a --format=\"table {{.ID}}\t{{.Names}}\t{{.Status}}\t{{.Ports}}\""
fi

# Kube and ssh and staging and production
alias stage-login="asp jiffy-staging login"
alias prod-login="asp jiffy-staging login"
alias stage-kube-conf="aws eks update-kubeconfig --region us-east-1 --name staging-cluster --profile jiffy-staging"
alias prod-kube-conf="aws eks update-kubeconfig --region us-east-1 --name production-cluster --profile jiffy-production"
alias k8stage='stage-login && stage-kube-conf'
alias k8prod='prod-login && prod-kube-conf'

function check_session() {
  aws sts get-caller-identity --profile $1 > /dev/null 2>&1
}

function ssh-connect() {
  local branch=$(git rev-parse --abbrev-ref HEAD)
  local current_dir=$(basename "$PWD")

  if [ "$current_dir" != "spree_jiffyshirts" ]; then
    jiffy
  fi

  if [ "$branch" = "main" ]; then
    if ! check_session "jiffy-production"; then
      echo "Production session expired or not logged in, logging in..."
      prod-login
      prod-kube-conf
    else
      echo "Production session is valid."
    fi
    ./infrastructure/bin/connect_to_container.sh -a jiffy -e production -p jiffy-production
  else
    if ! check_session "jiffy-staging"; then
      echo "Staging session expired or not logged in, logging in..."
      stage-login
      stage-kube-conf
    else
      echo "Staging session is valid."
    fi
  fi

  if [ "$branch" = "main" ]; then
    ./infrastructure/bin/connect_to_container.sh -a jiffy -e production -p jiffy-production
  else
    local pr_number=$(gh pr view --json number --jq '.number')
    ./infrastructure/bin/connect_to_container.sh -a "jiffy-$pr_number" -p jiffy-staging
  fi
}

alias sc="ssh-connect"
