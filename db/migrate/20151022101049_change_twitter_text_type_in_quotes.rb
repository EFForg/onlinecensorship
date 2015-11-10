class ChangeTwitterTextTypeInQuotes < ActiveRecord::Migration
  def change
  	change_column :quotes, :twitter_text, :text
  end
end