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

# LINODE
function start_linode() {
  # Create the Linode and capture the output in a variable
  linode_output=$(linode-cli linodes create \
    --authorized_users praveendhawan \
    --backups_enabled false \
    --booted true \
    --image private/25741247 \
    --label devbox \
    --private_ip false \
    --region ap-west \
    --root_pass 'praveen@jiffy#123' \
    --type g6-standard-4 \
    # --type g6-nanode-1 \
    --json | grep -v '{}' | grep -Eo '\{.*\}')

  # Extract the Linode ID and IP from the JSON output
  linode_id=$(echo "$linode_output" | jq -r '..id')
  linode_ip=$(echo "$linode_output" | jq -r '..ipv4[0]')

  # Get the Volume ID for the volume named "storage"
  volume_id=$(linode-cli volumes list --label storage --json | jq -r '.[0].id')

  # Attach the volume to the Linode
  linode-cli volumes attach $volume_id --linode_id $linode_id

  # Reboot linode after attaching volume
  linode-cli linodes reboot $linode_id

  echo "Linode created with ID: $linode_id and IP: $linode_ip"
  echo "Volume attached with ID: $volume_id"
}

# Kube and ssh and staging and production
alias stage-login="asp jiffy-staging login"
alias prod-login="asp jiffy-production login"
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
  local target_env="$1"

  if [ "$current_dir" != "spree_jiffyshirts" ]; then
    jiffy
  fi

  if [ "$target_env" = "prod" ] || ([ -z "$target_env" ] && [ "$branch" = "main" ]); then
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

    if [ -z "$target_env" ]; then
      target_env=$(gh pr view --json number --jq '.number')
    fi
    echo "connecting to jiffy-$target_env"
    ./infrastructure/bin/connect_to_container.sh -a "jiffy-$target_env" -p jiffy-staging
  fi
}

function prod-custom-pod() {
  local current_dir=$(basename "$PWD")

  if [ "$current_dir" != "spree_jiffyshirts" ]; then
    jiffy
  fi

  if ! check_session "jiffy-production"; then
    echo "Production session expired or not logged in, logging in..."
    prod-login
    prod-kube-conf
  else
    echo "Production session is valid."
  fi
  ./infrastructure/bin/start_console.sh -n "$1" -p jiffy-production
}

alias sc="ssh-connect"
alias npp="prod-custom-pod"
