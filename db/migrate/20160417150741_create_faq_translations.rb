class CreateFaqTranslations < ActiveRecord::Migration
  def up
    Faq.create_translation_table!({
      :question => :text,
      :answer => :text
    }, {
      :migrate_data => true
    })
  end
  def down
  	Faq.drop_translation_table! :migrate_data => true
  end
end
