class PlatformLink < ApplicationRecord
  translates :platform_name, :help_link, :support_link
  attribute :platform_name
  attribute :help_link
  attribute :support_link
end
