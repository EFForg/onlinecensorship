class AddCountriesTranslations < ActiveRecord::Migration
  def up
    Country.create_translation_table!({
    	:name => :string
    }, {
      :migrate_data => true
    })
  end
  def down
  	Country.drop_translation_table! :migrate_data => true
  end
end
