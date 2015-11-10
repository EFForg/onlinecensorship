# Language
#
# The admin can add language as dropdown menu in the questions 
#
class Language < ActiveRecord::Base

  ## DB relations
  has_many :question_answers

  # For use search method
  extend Search

  # Validation
  validates :name, :presence => true

end