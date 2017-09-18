class CreateWebPagesTranslations < ActiveRecord::Migration
  def up
    WebPage.create_translation_table!({
      :title => :string,
      :brief => :text,
      :content => :text
    }, {
      :migrate_data => true
    })
  end
  def down
  	WebPage.drop_translation_table! :migrate_data => true
  end
end
