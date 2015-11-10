class RemoveQuestionOptionsTableUnneededFields < ActiveRecord::Migration
  def change
	  remove_column :question_options, :next_page
	  remove_column :question_options, :dependent_on_question_id
  end
end