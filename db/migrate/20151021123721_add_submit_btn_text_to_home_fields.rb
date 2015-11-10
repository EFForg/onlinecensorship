class AddSubmitBtnTextToHomeFields < ActiveRecord::Migration
  def change
    add_column :home_fields, :submit_btn_text, :string
  end
end