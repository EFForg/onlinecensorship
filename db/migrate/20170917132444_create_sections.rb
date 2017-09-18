class CreateSections < ActiveRecord::Migration
  def change
  	drop_table :sections if (table_exists? :sections)
    create_table :sections do |t|
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
