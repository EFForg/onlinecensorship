class CraetePlatformLinkTranslations < ActiveRecord::Migration
  def up
    PlatformLink.create_translation_table!({
      :platform_name => :string,
      :help_link => :string,
      :support_link => :string
    }, {
      :migrate_data => true
    })
  end
  def down
  	Visual.drop_translation_table! :migrate_data => true
  end
end
