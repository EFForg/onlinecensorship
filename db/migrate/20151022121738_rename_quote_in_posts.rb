class RenameQuoteInPosts < ActiveRecord::Migration
  def change
		rename_column :posts, :quote, :quote_text
  end
end