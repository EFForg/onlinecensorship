# QuestionOption
#
# The admin can add alot of option to every checkbox or radio button questions
#
class QuestionOption < ApplicationRecord
  belongs_to :question
  has_many :question_answers

  validates :option_title, :presence => true

  translates :option_title
end
