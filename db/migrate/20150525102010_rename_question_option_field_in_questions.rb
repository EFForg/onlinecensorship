class RenameQuestionOptionFieldInQuestions < ActiveRecord::Migration
  def change
		if !column_exists? :questions, :question_option_id
			rename_column :questions, :question_option, :question_option_id
		end
  end
end