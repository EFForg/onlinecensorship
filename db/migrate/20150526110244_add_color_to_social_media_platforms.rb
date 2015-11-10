class AddColorToSocialMediaPlatforms < ActiveRecord::Migration
  def change
    add_column :social_media_platforms, :color, :string
  end
end