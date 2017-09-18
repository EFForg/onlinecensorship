class CreateSubSectionsTranslations < ActiveRecord::Migration
  def up
    SubSection.create_translation_table!({
      :title => :string,
      :content => :text
    }, {
      :migrate_data => true
    })
  end
  def down
  	SubSection.drop_translation_table! :migrate_data => true
  end
end
