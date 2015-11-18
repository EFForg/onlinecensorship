require 'raven'

unless ENV['sentry_dsn'].nil?
  Raven.configure do |config|
    config.dsn = ENV['sentry_dsn']
  end
end
