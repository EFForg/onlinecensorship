class AddTitleToContentManagementPages < ActiveRecord::Migration
  def change
    add_column :content_management_pages, :page_title, :string
  end
end
