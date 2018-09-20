require 'raven'

unless ENV['SENTRY_DSN'].nil?
  Raven.configure do |config|
    config.dsn = ENV['SENTRY_DSN']
  end
end
