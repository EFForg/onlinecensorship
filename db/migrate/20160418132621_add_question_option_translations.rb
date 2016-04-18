class AddQuestionOptionTranslations < ActiveRecord::Migration
  def up
    QuestionOption.create_translation_table!({
    	:option_title => :string
    }, {
      :migrate_data => true
    })
  end
  def down
  	QuestionOption.drop_translation_table! :migrate_data => true
  end
end
