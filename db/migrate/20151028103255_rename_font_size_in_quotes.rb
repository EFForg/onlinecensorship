class RenameFontSizeInQuotes < ActiveRecord::Migration
  def change
	  remove_column :quotes, :font_size
  	add_column :quotes, :font_size, :integer , :default => 16
  end
end