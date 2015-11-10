class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :surname
      t.string :email
      t.string :pgp_key
      t.integer :contacts_topic_id
      t.text :message

      t.timestamps
    end
  end
end
