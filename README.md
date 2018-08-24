# Online Censorship

## Setting up a development environment

### With Docker
```
$ cp .env.example .env
$ cp docker-compose.example.yml docker-compose.yml
$ docker-compose build
$ docker-compose up
```

If you have a database dump:
```
$ docker-compose exec app bash
$ bundle exec rails db < PATH_TO_DB_DUMP.sql
```

Otherwise:
```
$ docker-compose exec app bundle exec rake db:setup
```

### Without Docker

Install Ruby 2.5.1 with rbenv and MySQL, then
```
$ gem install bundler
$ bundle install
$ cp config/application.yml.example config/application.yml.example
$ cp config/database.yml.example config/database.yml
$ cp .env.example .env
```

Edit `.env` and set the database variables (`DB_USERNAME`, `DB_PASSWORD`,
`DB_HOST`, `MYSQL_DATABASE`). For typical local setups, `DB_HOST` should be
`localhost`.

```
$ bundle exec rake db:setup
$ rails s
```

Onlinecensorship should be accessible at [localhost:3000](localhost:3000). 
The admin interface is accessible with the login `admin@example.com` and
password `password`.
