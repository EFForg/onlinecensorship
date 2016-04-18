class AddContactTopicTranslations < ActiveRecord::Migration
  def up
    ContactsTopic.create_translation_table!({
    	:name => :string
    }, {
      :migrate_data => true
    })
  end
  def down
  	ContactsTopic.drop_translation_table! :migrate_data => true
  end
end
