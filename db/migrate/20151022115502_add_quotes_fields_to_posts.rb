class AddQuotesFieldsToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :quote_title, :string
    add_column :posts, :quote_auther, :string
    add_column :posts, :font_size, :integer
    add_column :posts, :quote, :text
    add_column :posts, :twitter_text, :text
  end
end