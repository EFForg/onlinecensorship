#!/bin/sh
export DATABASE_URL=$(echo $DATABASE_URL | sed 's/mysql:\/\//mysql2:\/\//' )
bundle exec puma -C config/puma.rb
