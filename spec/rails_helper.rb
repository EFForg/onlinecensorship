# frozen_string_literal: true

require 'simplecov'
SimpleCov.start

ENV['RACK_ENV'] = 'test'

require File.expand_path('../../config/environment', __FILE__)
abort('DATABASE_URL environment variable is set') if ENV['DATABASE_URL']

require 'rspec/rails'
require 'capybara/rspec'
require 'capybara/apparition'

SUPPORT_PATH = %w(spec support ** *.rb).freeze

Dir[Rails.root.join(*SUPPORT_PATH)].sort.each { |file| require file }

module Features
  # Capybara Config
  include Capybara::DSL
  Capybara.asset_host = 'http://0.0.0.0:3000'
  Capybara.javascript_driver = :apparition
end

RSpec.configure do |config|
  config.include Features, type: :feature
  config.infer_base_class_for_anonymous_controllers = false
  config.infer_spec_type_from_file_location!

  # DatabaseCleaner set up
  config.use_transactional_fixtures = false
  config.before(:suite) do
    DatabaseCleaner.clean_with(:deletion)
  end
  config.before(:each) { DatabaseCleaner.strategy = :transaction }
  config.before(:each, js: true) { DatabaseCleaner.strategy = :truncation }
  config.before(:each) { DatabaseCleaner.start }
  config.after(:each) { DatabaseCleaner.clean }
end

ActiveRecord::Migration.maintain_test_schema!
