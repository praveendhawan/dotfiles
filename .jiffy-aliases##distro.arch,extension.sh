if [ -x "$(command -v docker)" ]; then
# GLOBAL VARIABLES
  BASE_DOCKER_COMPOSE_COMMAND="docker-compose -f docker-compose-praveen.yml -f docker-compose-without-nfs-praveen.yml --env-file .env --env-file .my_env"
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
