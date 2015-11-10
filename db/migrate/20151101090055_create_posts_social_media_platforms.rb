class CreatePostsSocialMediaPlatforms < ActiveRecord::Migration
  def change
    create_table :posts_social_media_platforms do |t|
      t.integer :post_id
      t.integer :social_media_platform_id

      t.timestamps
    end
  end
end
