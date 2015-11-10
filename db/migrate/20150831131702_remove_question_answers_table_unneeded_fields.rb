class RemoveQuestionAnswersTableUnneededFields < ActiveRecord::Migration
  def change
	  remove_column :question_answers, :question_user_id
  end
end