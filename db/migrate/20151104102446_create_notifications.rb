class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.string :name
      t.string :email
      t.boolean :submit_report
      t.boolean :contact_us
      t.boolean :subscriber

      t.timestamps
    end
  end
end