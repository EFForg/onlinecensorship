# Faq
#
# The admin can add questions and answers for the users 
#
class Faq < ApplicationRecord
  ransack_alias :searchable, translated_search(%i(question answer))

  # Validation
  validates :question, :answer, :presence => true

  translates :question, :answer
  attribute :question
  attribute :answer
end
