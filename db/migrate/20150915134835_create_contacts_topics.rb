class CreateContactsTopics < ActiveRecord::Migration
  def change
    create_table :contacts_topics do |t|
      t.string :name

      t.timestamps
    end
  end
end
