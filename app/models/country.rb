# Country
#
# The admin can add country as dropdown menu in the questions 
#
class Country < ApplicationRecord
  
  ## DB relations
  has_many :question_users
  has_many :question_answers

  ransack_alias :searchable, translated_search(%i(name))

  # Validation
  validates :name, :presence => true

  translates :name
  attribute :name
end
