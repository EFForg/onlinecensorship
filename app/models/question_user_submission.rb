# QuestionUserSubmission
#
# When the users answer the questions we store the users and the question data in this model
#
class QuestionUserSubmission < ActiveRecord::Base

  ## DB relations
  has_one :question_answer
  belongs_to :page
	belongs_to :question_user


  # Validation
  validates :page_id,:question_user_id, :presence => true

end