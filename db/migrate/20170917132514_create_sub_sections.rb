class CreateSubSections < ActiveRecord::Migration
  def change
  	drop_table :sub_sections if (table_exists? :sub_sections)
    create_table :sub_sections do |t|
      t.string :title
      t.attachment :icon
      t.text :content

      t.timestamps
    end
  end
end
