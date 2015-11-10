class AddTheorderToPeople < ActiveRecord::Migration
  def change
    add_column :people, :theorder, :integer
  end
end