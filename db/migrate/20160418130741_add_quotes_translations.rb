class AddQuotesTranslations < ActiveRecord::Migration
  def up
    Quote.create_translation_table!({
    	:author => :string,
    	:quote => :text,
    	:twitter_text => :text
    }, {
      :migrate_data => true
    })
  end
  def down
  	Quote.drop_translation_table! :migrate_data => true
  end
end
