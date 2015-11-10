class CreateQuestionAnswers < ActiveRecord::Migration
  def change
    create_table :question_answers do |t|
      t.integer :question_id
      t.integer :question_user_id
      t.integer :uploaded_file_id
      t.integer :question_option_id
      t.integer :country_id
      t.integer :language_id
      t.text :answer_text

      t.timestamps
    end
  end
end
