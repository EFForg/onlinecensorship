class AddColumnsToPages < ActiveRecord::Migration
  def change
    add_column :pages, :theorder, :integer
  end
end