ruby '2.5.1'
source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 4.2'
# Use mysql as the database for Active Record
gem 'mysql2', '< 0.5'
gem 'rails_12factor'
gem 'figaro'

group :assets do
  gem 'sass-rails', '~> 4.0'
  gem 'coffee-rails', '~> 4.0'
  gem 'uglifier', '~> 4.1'
  #gem 'turbo-sprockets-rails3' # faster asset compilation
end


gem 'less-rails', '~> 2.8'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'therubyracer',  platforms: :ruby
gem 'twitter-bootstrap-rails'

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4',          group: :doc

# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
gem 'spring', '~> 1.3' ,      group: :development

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
#gem 'unicorn'
gem 'puma', '~> 2.14'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
group :development, :test do
  gem 'pry'
  gem 'better_errors'
  gem "binding_of_caller"
  gem 'byebug'
  gem 'capistrano', '~> 3.3.0', require: false
  gem 'capistrano-rails',   '~> 1.1', require: false
  gem 'capistrano-bundler', '~> 1.1', require: false
  gem 'capistrano-rbenv', '~> 2.0', require: false
  gem 'rspec-rails', '~> 3.7'
  gem 'factory_bot_rails', '~> 4.10'
end

group :test do
  gem 'capybara-webkit', '~> 1.15'
  gem 'database_cleaner'
  gem 'simplecov', '~> 0.16'
  gem 'launchy'
end

# logging
gem "sentry-raven"

# Use debugger
# gem 'debugger', group: [:development, :test]

# Manage attachements images
gem 'aws-sdk-v1'
gem 'paperclip'
gem 'rmagick'
gem 'aws-s3'

# translation
gem 'globalize', '~> 5.0'

gem 'metamagic'

# Manage authentication
gem 'devise', '~> 4.4'

# Pagination gem
gem 'kaminari'

# Sass mixin library
gem 'bourbon'

# gem 'owlcarousel-rails', github: 'acrogenesis/owlcarousel-rails', branch: 'OwlCarousel2'

# for loading bar (like medium loading)
gem 'nprogress-rails'

# for add ckeditor in the backend
gem 'ckeditor_rails'

# for frindly urls
gem 'friendly_id', '~> 5.0'

gem "select2-rails"
