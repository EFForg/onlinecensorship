class AddFontAwesomeToSocialMediaPlatforms < ActiveRecord::Migration
  def change
    add_column :social_media_platforms, :font_awesome_style, :string
  end
end
