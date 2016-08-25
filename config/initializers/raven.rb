require 'raven'

unless ENV['sentry_dsn'].nil?
  Raven.configure do |config|
    config.dsn = "https://6e9a4086fc244ffa92ddefc5a6e8f7ce:2b4179645a6640a3a3df76a23276e60d@sentry.eff.org/5" # ENV['sentry_dsn']
  end
end
