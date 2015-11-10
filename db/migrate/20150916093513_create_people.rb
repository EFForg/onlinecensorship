class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.text :bio
      t.boolean :advisor
      t.boolean :team
      t.boolean :author
      t.attachment :photo

      t.timestamps
    end
  end
end
