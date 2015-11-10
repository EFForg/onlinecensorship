class CreatePostsThemes < ActiveRecord::Migration
  def change
    create_table :posts_themes do |t|
      t.string :title

      t.timestamps
    end
  end
end
