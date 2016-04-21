class AddThemesTranslations < ActiveRecord::Migration
  def up
    PostsTheme.create_translation_table!({
    	:title => :string
    }, {
      :migrate_data => true
    })
  end
  def down
  	PostsTheme.drop_translation_table! :migrate_data => true
  end
end
