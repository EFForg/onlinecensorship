class CreateQuotes < ActiveRecord::Migration
  def change
    create_table :quotes do |t|
      t.string :title
      t.string :auther
      t.integer :font_size
      t.text :quote

      t.timestamps
    end
  end
end
