class AddLogoToSocialMediaPlatform < ActiveRecord::Migration
  def change
 		add_attachment :social_media_platforms, :logo
  end
end