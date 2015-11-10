class AddTwitterTextToQuotes < ActiveRecord::Migration
  def change
    add_column :quotes, :twitter_text, :string
    add_column :quotes, :featured, :boolean, :default => 1
  end
end