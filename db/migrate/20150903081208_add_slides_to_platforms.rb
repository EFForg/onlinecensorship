class AddSlidesToPlatforms < ActiveRecord::Migration
  def change
    add_column :social_media_platforms, :slides, :integer
  end
end
