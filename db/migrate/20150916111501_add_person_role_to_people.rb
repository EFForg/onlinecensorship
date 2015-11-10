class AddPersonRoleToPeople < ActiveRecord::Migration
  def change
    add_column :people, :role, :text
  end
end