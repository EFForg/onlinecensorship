class RemoveQuoteIdFromPosts < ActiveRecord::Migration
  def change
		remove_column :posts,:quote_id
		remove_column :posts,:font_size
		remove_column :posts,:quote_title
  end
end