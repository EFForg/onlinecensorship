class AddHomeFieldsTranslations < ActiveRecord::Migration
  def up
    HomeField.create_translation_table!({
    	:slogan => :text,
      :what_oc_title => :string,
      :what_oc_text => :text,
      :appeal_text => :text,
      :appeal_btn_text => :string,
      :submit_btn_text => :string
    }, {
      :migrate_data => true
    })
  end
  def down
  	HomeField.drop_translation_table! :migrate_data => true
  end
end
