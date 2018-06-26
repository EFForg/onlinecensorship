# Faq
#
# The admin can add questions and answers for the users 
#
class Faq < ApplicationRecord

  # For use search method
  extend Search

  # Validation
  validates :question, :answer, :presence => true

  translates :question, :answer
  attribute :question
  attribute :answer
end
