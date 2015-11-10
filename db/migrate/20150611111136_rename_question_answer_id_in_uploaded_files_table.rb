class RenameQuestionAnswerIdInUploadedFilesTable < ActiveRecord::Migration
  def change
  	if column_exists? :uploaded_files, :question_id
	  	rename_column :uploaded_files, :question_answer_id, :question_id
  	end
  end
end