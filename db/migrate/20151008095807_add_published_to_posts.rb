class AddPublishedToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :published, :boolean , :default => 1
  end
end