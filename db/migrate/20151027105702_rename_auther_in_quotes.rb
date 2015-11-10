class RenameAutherInQuotes < ActiveRecord::Migration
  def change
		rename_column :posts, :quote_auther, :quote_author
		rename_column :quotes, :auther, :author
  end
end