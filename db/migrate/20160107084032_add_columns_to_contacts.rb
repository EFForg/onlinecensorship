class AddColumnsToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :replied, :boolean, default: false
    add_column :contacts, :replied_by, :string
  end
end
