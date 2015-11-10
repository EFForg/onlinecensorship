class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.text :title
      t.string :brief
      t.string :content
      t.text :external_link
      t.boolean :published, :default => 1

      t.timestamps
    end
  end
end