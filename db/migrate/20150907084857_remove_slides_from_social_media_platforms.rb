class RemoveSlidesFromSocialMediaPlatforms < ActiveRecord::Migration
  def change
  	remove_column :social_media_platforms, :slides
  end
end
