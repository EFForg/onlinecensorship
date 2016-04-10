require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Oc
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # allow app to integrate with chrome's https safety list https://hstspreload.appspot.com/
    config.action_dispatch.default_headers.merge!('Strict-Transport-Security' => 'max-age=63072000; includeSubDomains; preload')

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    config.i18n.default_locale = :en
    config.i18n.available_locales = [:en, :ar]
    config.i18n.fallbacks = true

    # Add the fonts path
    config.assets.paths << "#{Rails.root}/app/assets/fonts"

    # Precompile additional assets
    config.assets.precompile += %w( .svg .eot .woff .ttf )

    config.assets.enabled = true

    # Disable automatic generation of test files
    config.generators.test_framework false

    # Enable loading from /lib
    config.autoload_paths += %W(#{config.root}/lib)

    unless ENV['attachment_storage'].nil? or ENV['attachment_storage'] == 'file'
      config.paperclip_defaults = {
        :storage => ENV['attachment_storage'],
        :s3_host_name => "s3-#{ENV['aws_region']}.amazonaws.com",
        :s3_protocol => :https,
        :bucket => ENV['aws_bucket']
      }
    end

  end
end
