class AddQuestionUserSubmissionIdToQuestionAnswers < ActiveRecord::Migration
  def change
    add_column :question_answers, :question_user_submission_id, :integer
  end
end
