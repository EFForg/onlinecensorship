class CreatePostsPostsThemes < ActiveRecord::Migration
  def change
    create_table :posts_posts_themes do |t|
      t.integer :post_id
      t.integer :posts_theme_id

      t.timestamps
    end
  end
end