# QuestionUser
#
# The users can answer the questions and we store the users data in this model
#
class QuestionUser < ActiveRecord::Base

  ## DB relations
  has_many :question_user_submissions
  belongs_to :country

  # change the id order
  default_scope { order("id DESC") }

  # For use search method
  extend Search

end