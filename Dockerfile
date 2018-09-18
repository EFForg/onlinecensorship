FROM ruby:2.5-alpine

RUN mkdir -p /opt/oc /opt/oc/tmp
WORKDIR /opt/oc

ARG BUILD_ENV=production

RUN if [ "$BUILD_ENV" = "development" ]; then \
      adduser -Du 1000 -h /opt/oc www-data; \
    else \
      adduser -DS -h /opt/oc www-data; \
    fi

RUN echo "@edge http://nl.alpinelinux.org/alpine/edge/main" >>/etc/apk/repositories \
  && echo "@edgecommunity http://nl.alpinelinux.org/alpine/edge/community" >>/etc/apk/repositories \
  && apk upgrade --update-cache

RUN apk add \
    build-base \
    git \
    mysql-dev \
    mysql-client \
    imagemagick-dev \
    qt5-qtwebkit-dev \
    nodejs

# RUN echo 'http://dl-cdn.alpinelinux.org/alpine/v3.5/main' >> /etc/apk/repositories \
#   && apk add --no-cache imagemagick-dev=6.9.6.8-r1

COPY Gemfile* ./
RUN QMAKE=/usr/lib/qt5/bin/qmake gem install capybara-webkit
RUN bundle install

COPY . .

RUN cp ./app/assets/fonts/* /usr/share/fonts

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
