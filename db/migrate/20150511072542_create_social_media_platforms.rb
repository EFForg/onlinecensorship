class CreateSocialMediaPlatforms < ActiveRecord::Migration
  def change
    create_table :social_media_platforms do |t|
      t.string :title

      t.timestamps
    end
  end
end
