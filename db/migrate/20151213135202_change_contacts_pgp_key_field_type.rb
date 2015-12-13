class ChangeContactsPgpKeyFieldType < ActiveRecord::Migration
  def change
    change_column :contacts, :pgp_key, :text
  end
end
