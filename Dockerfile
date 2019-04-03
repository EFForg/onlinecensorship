FROM ruby:2.5.3-slim

RUN mkdir -p /opt/oc /opt/oc/tmp
WORKDIR /opt/oc

ARG BUILD_ENV=production

RUN if [ "$BUILD_ENV" = "development" ]; then \
      adduser -Du 1000 -h /opt/oc www-data; \
    else \
      adduser -DS -h /opt/oc www-data; \
    fi

RUN apt-get update && apt-get install -y \
  curl \
  build-essential \
  default-libmysqlclient-dev \
  mysql-client \
  libfontconfig \
  nodejs \
  cron \
  qt5-default \
  libqt5webkit5-dev \
  gstreamer1.0-plugins-base \
  gstreamer1.0-tools \
  gstreamer1.0-x \
  libssl-dev \
  libmagickwand-dev \
  imagemagick \
  && echo "*/15 * * * * su -s/bin/sh www-data -c \
    'cd /opt/oc && bundle exec rake import_deeplinks' >>/proc/1/fd/1 2>&1" >>/etc/crontab

COPY Gemfile* ./
RUN bundle install

COPY . .

RUN if [ "$BUILD_ENV" = "production" ]; \
  then bundle exec rake assets:precompile \
  RAILS_ENV=production \
  SECRET_KEY_BASE=noop; fi

RUN mkdir -p /var/www /opt/oc/files \
  && chown -R www-data /opt/oc/public \
                       /opt/oc/files \
                       /opt/oc/tmp \
                       /var/www \
                       /usr/local/bundle
USER www-data

CMD ["rails", "s", "-b", "0.0.0.0"]
ENTRYPOINT ["/opt/oc/entrypoint.sh"]
