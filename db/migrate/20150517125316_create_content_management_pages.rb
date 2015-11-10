class CreateContentManagementPages < ActiveRecord::Migration
  def change
    create_table :content_management_pages do |t|
      t.string :page
      t.text :content

      t.timestamps
    end
  end
end
