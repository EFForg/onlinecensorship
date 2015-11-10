class AddBriefToContentManagementPages < ActiveRecord::Migration
  def change
    add_column :content_management_pages, :brief, :text
  end
end
