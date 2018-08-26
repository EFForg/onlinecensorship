class AddAppealPageToCmsPages < ActiveRecord::Migration[5.1]
  def change
    add_column :content_management_pages, :appeal_page, :boolean, :default => false
  end
end
