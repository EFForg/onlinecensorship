class CreatePeopleTranslations < ActiveRecord::Migration
  def up
    Person.create_translation_table!({
      :name => :string,
      :bio => :text,
      :role => :text
    }, {
      :migrate_data => true
    })
  end
  def down
  	Person.drop_translation_table! :migrate_data => true
  end
end
