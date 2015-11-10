class RemoveTitleFromQuotes < ActiveRecord::Migration
  def change
		remove_column :quotes,:title
  end
end