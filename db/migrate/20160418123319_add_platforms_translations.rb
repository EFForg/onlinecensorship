class AddPlatformsTranslations < ActiveRecord::Migration
  def up
    SocialMediaPlatform.create_translation_table!({
    	:title => :string
    }, {
      :migrate_data => true
    })
  end
  def down
  	SocialMediaPlatform.drop_translation_table! :migrate_data => true
  end
end
