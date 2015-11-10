class CreateHomeFields < ActiveRecord::Migration
  def change
    create_table :home_fields do |t|
      t.text :slogan
      t.string :what_oc_title
      t.text :what_oc_text
      t.text :appeal_text
      t.string :appeal_btn_text

      t.timestamps
    end
  end
end