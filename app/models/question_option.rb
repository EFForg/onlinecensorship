# QuestionOption
#
# The admin can add alot of option to every checkbox or radio button questions
#
class QuestionOption < ActiveRecord::Base

  ## DB relations
  belongs_to :question
  has_many :question_answers

  # For use search method
  extend Search

  # Validation
  validates :option_title, :presence => true

end