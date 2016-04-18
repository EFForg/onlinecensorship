# Faq
#
# The admin can add questions and answers for the users 
#
class Faq < ActiveRecord::Base

  # For use search method
  extend Search

  # Validation
  validates :question, :answer, :presence => true

  translates :question, :answer

end