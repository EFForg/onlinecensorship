class RemovePostsThemeIdFromPosts < ActiveRecord::Migration
  def change
		remove_column :posts,:posts_theme_id
		remove_column :posts,:social_media_platform_id
  end
end