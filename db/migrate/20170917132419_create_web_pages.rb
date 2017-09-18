class CreateWebPages < ActiveRecord::Migration
  def change
  	drop_table :web_pages if (table_exists? :web_pages)
    create_table :web_pages do |t|
      t.string :title
      t.text :brief
      t.text :content
      t.string :slug

      t.timestamps
    end
  end
end
