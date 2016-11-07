class PlatformLink < ActiveRecord::Base
	translates :platform_name, :help_link, :support_link
end
