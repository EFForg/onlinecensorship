class CreatePostsThemesQuotes < ActiveRecord::Migration
  def change
    create_table :posts_themes_quotes do |t|
      t.integer :quote_id
      t.integer :posts_theme_id

      t.timestamps
    end
  end
end