class AddThemeIdToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :posts_theme_id, :integer
    add_column :posts, :social_media_platform_id, :integer
  end
end