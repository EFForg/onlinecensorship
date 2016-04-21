class CreateFurtherReadTranslations < ActiveRecord::Migration
  def up
    FurtherRead.create_translation_table!({
      :title => :string,
      :author => :string,
      :written_in => :string
    }, {
      :migrate_data => true
    })
  end
  def down
  	FurtherRead.drop_translation_table! :migrate_data => true
  end
end
