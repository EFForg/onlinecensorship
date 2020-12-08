# Question
#
# The admin can add many questions to any slider page and social media platform
#
class Question < ApplicationRecord
  has_many :question_options
	has_many :question_answers
  has_many :pages_questions
  has_and_belongs_to_many :pages, through: :pages_questions

	accepts_nested_attributes_for :question_options,
                                reject_if: proc { |attributes| attributes['option_title'].blank? }, # to remove blank field
                                allow_destroy: true  # to allow admin to remove options

  ransack_alias :searchable, translated_search_any(%i(question_title))

  validates :question_title,:question_type, :presence => true

  translates :question_title, :prompt_text, :placeholder, :prompt_link
end
