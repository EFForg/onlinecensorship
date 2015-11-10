class AddSlugToSocialMediaPlatforms < ActiveRecord::Migration
  def change
    add_column :social_media_platforms, :slug, :string
  end
end