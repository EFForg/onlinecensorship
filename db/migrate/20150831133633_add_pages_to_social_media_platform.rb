class AddPagesToSocialMediaPlatform < ActiveRecord::Migration
  def change
    add_column :social_media_platforms, :pages, :integer
  end
end