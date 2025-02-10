if [ -x "$(command -v docker)" ]; then
# GLOBAL VARIABLES
  BASE_DOCKER_COMPOSE_COMMAND="docker compose -f docker-compose.yml -f docker-compose-without-nfs.yml -f docker-compose-praveen.yml --env-file .env --env-file .my_env"

# BASE ALIAS
  alias jdc="$BASE_DOCKER_COMPOSE_COMMAND"
  alias dces="$BASE_DOCKER_COMPOSE_COMMAND exec spring"

# Functions

# Attach to process running inside docker container
  function jd_attach() {
    attach_to=$1
    docker attach $(docker ps | grep $attach_to | tr -s " " | cut -d " " -f 1)
  }

# Running Rubocop for code changes
  function run_rubo_bc() {
    eval "$BASE_DOCKER_COMPOSE_COMMAND run --rm rails bash -c -l \"git ls-files -m | xargs ls -1 2>/dev/null | grep '\.rb$' | xargs bundle exec rubocop\""
  }

  function run_rubo_ac() {
    eval "$BASE_DOCKER_COMPOSE_COMMAND run --rm rails bash -c -l \"git diff-tree -r --no-commit-id --name-only head origin/main | xargs bundle exec rubocop\""
  }

# Running Feature specs
  function jd_fspec() {
    spec_file=${1:-""}
    mobile_only=${2:-"FEATURES_DESKTOP=yes"}
    eval "$BASE_DOCKER_COMPOSE_COMMAND run --rm -p 5900:5900 rails bash -c -l \"FEATURES_HEADED=yes FEATURES_RESKINNED=yes $mobile_only bin/scripts/run_features.sh $spec_file\""
  }

# Running Migrations/Rollbacks
# Running Rollback
  function run_rollback() {
    echo "Running Rollback for Dev Environment"
    eval "$BASE_DOCKER_COMPOSE_COMMAND exec spring bundle exec spring rails db:rollback"

    echo "Running Rollback for Test Environment"
    eval "$BASE_DOCKER_COMPOSE_COMMAND exec spring bundle exec spring rails db:rollback RAILS_ENV=test"
  }

# Running Migrations
  function run_migrations() {
    checkout_changes=true
    if git status --porcelain | grep db/; then
      checkout_changes=false
    fi

    echo "Running Migrations for Dev Environment"
    eval "$BASE_DOCKER_COMPOSE_COMMAND exec spring bundle exec spring rails db:migrate"

    echo "Now Running migrations for Test Env"
    eval "$BASE_DOCKER_COMPOSE_COMMAND exec spring bundle exec spring rails db:migrate RAILS_ENV=test"

    if $checkout_changes; then
      echo "checking out db/structure.sql changes"
      git co db/structure.sql
    else
      echo "not checking out structure file changes as we have added migrations"
    fi
  }

# Run any Code in Docker Ruby
  function run_in_docker() {
   ruby_version=$1

   docker run --rm -it -v ${PWD}:/home/app ruby:$ruby_version bash
  }

# Aliases
  alias jd_be="dces bundle exec"
  alias jd_bi="dces bundle"
  # alias jd_rails_bash="$DOCKER_RAILS_COMMAND bash"
  alias jd_rc="dces bundle exec spring rails c"
  alias jd_attach_rails="jd_attach rails"
  alias jd_rspec="dces bundle exec spring rspec"
  alias jd_postgres="jdc exec postgres psql -U postgres -d jiffyshirts_development"
  alias jd_rubo="dces bundle exec rubocop -a"
  # alias jd_setup_fspec="$DOCKER_RAILS_COMMAND bash -l -c \"bundle exec bin/scripts/setup_features.sh\""
  alias jd_update_db="dces bundle exec spring rails db:bootstrap_jiffy REINDEX=false DOWNLOAD=true RESET_SCHEMA=true"

  alias jd_rubo_ac="run_rubo_ac"
  alias jd_rubo_bc="run_rubo_bc"

  alias jd_migrate="run_migrations"

  alias jd_rollback="run_rollback"

  alias dps_pretty="docker ps -a --format=\"table {{.ID}}\t{{.Names}}\t{{.Status}}\t{{.Ports}}\""
fi

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
      echo "connecting to jiffy-$target_env"
      ./infrastructure/bin/connect_to_container.sh -a "jiffy-$target_env" -p jiffy-staging
    elif ([ "$target_env" = "stage" ] || [ "$target_env" = "staging" ]); then
      echo "connecting to jiffy-$target_env"
      ./infrastructure/bin/connect_to_container.sh -p jiffy-staging
    elif ([ "$target_env" = "mobile" ]); then
      echo "connecting to jiffy-$target_env"
      ./infrastructure/bin/connect_to_container.sh  -a jiffy-mobile -p jiffy-staging
    fi
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
  ./infrastructure/bin/start_console.sh -n "$1"
}

alias sc="ssh-connect"
alias npp="prod-custom-pod"
