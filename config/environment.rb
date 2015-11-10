# Load the Rails application.
require File.expand_path('../application', __FILE__)

Date::DATE_FORMATS.merge!(:default => "%b %d, %Y")

# Initialize the Rails application.
Rails.application.initialize!
