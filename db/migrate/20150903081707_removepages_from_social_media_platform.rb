class RemovepagesFromSocialMediaPlatform < ActiveRecord::Migration
  def change
  	if column_exists? :social_media_platforms, :pages
  		remove_column :social_media_platforms, :pages
		end
  end
end
