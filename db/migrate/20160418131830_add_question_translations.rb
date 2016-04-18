class AddQuestionTranslations < ActiveRecord::Migration
  def up
    Question.create_translation_table!({
    	:question_title => :text,
    	:prompt_text => :string,
    	:prompt_link => :string,
    	:placeholder => :text
    }, {
      :migrate_data => true
    })
  end
  def down
  	Question.drop_translation_table! :migrate_data => true
  end
end
