class CreatePagesTranslations < ActiveRecord::Migration
  def up
    ContentManagementPage.create_translation_table!({
      :content => :text,
      :brief => :text,
      :page_title => :string
    }, {
      :migrate_data => true
    })
  end
  def down
  	ContentManagementPage.drop_translation_table! :migrate_data => true
  end
end
