class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :category_id
      t.string :title
      t.text :description
      t.attachment :photo

      t.timestamps
    end
  end
end
