require 'raven'

unless ENV['SENTRY_DSN'].nil?
  Raven.configure do |config|
    config.dsn = ENV['SENTRY_DSN']
    config.timeout = 10
    config.open_timeout = 10
  end
end
