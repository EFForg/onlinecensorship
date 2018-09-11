class CreateTakedowns < ActiveRecord::Migration[5.1]
  def change
    create_table :takedowns do |t|
      t.string :platform, null: false
      t.string :reason, null: false
      t.string :email
      t.string :name
      t.text :details
      t.boolean :appealed, null: false

      t.timestamps
    end
    create_table :images do |t|
      t.belongs_to :takedown, null: false
      t.attachment :file, null: false

      t.timestamps
    end
  end
end
