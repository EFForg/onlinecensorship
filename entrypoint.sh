#!/bin/sh

# Install any missing gems without rebuilding
bundle install --quiet

if [ -f tmp/pids ]; then
    rm -r tmp/pids
fi

# Run migrations, if desired
if [ "$DB_MIGRATE" = "true" ]; then
  RAILS_ENV=$BUILD_ENV bundle exec rake db:migrate
fi

exec "$@"
