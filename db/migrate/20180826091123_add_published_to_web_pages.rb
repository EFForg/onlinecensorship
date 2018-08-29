class AddPublishedToWebPages < ActiveRecord::Migration[5.1]
  def change
    add_column :web_pages, :published, :boolean, :default => true
  end
end
