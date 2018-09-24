# Language
#
# The admin can add language as dropdown menu in the questions 
#
class Language < ApplicationRecord
	default_scope { order(name: :asc) }

  ## DB relations
  has_many :question_answers

  ransack_alias :searchable, translated_search(%i(name))

  # Validation
  validates :name, :presence => true

  translates :name
  attribute :name
end
