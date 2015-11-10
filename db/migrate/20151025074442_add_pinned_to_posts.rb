class AddPinnedToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :pinned, :boolean, :default => 0
  end
end