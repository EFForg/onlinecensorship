class AddConfirmationToTakedown < ActiveRecord::Migration[5.1]
  def change
    add_column :takedowns, :confirmed, :boolean, :default => false
    add_column :takedowns, :token, :string
  end
end
