class AddPublishedToWebPages < ActiveRecord::Migration
  def change
    add_column :web_pages, :published, :boolean, :default => true
  end
end
