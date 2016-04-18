class AddStoriesTranslations < ActiveRecord::Migration
  def up
    Story.create_translation_table!({
    	:title => :string,
      :brief => :text,
      :content => :text
    }, {
      :migrate_data => true
    })
  end
  def down
  	Story.drop_translation_table! :migrate_data => true
  end
end
