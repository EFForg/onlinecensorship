class AddIdColumns < ActiveRecord::Migration
  def change
  	add_column :sections, :web_page_id, :integer
  	add_column :sub_sections, :section_id, :integer
  end
end
