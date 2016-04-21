# Country
#
# The admin can add country as dropdown menu in the questions 
#
class Country < ActiveRecord::Base
  
  ## DB relations
  has_many :question_users
  has_many :question_answers

  # For use search method
  extend Search

  # Validation
  validates :name, :presence => true

  translates :name
end