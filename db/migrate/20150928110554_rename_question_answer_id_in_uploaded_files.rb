class RenameQuestionAnswerIdInUploadedFiles < ActiveRecord::Migration
  def change
  	if column_exists? :uploaded_files, :question_id
  		remove_column :uploaded_files, :question_id
	    add_column :uploaded_files, :question_answer_id, :integer
		end
  end
end