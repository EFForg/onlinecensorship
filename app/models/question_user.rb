# QuestionUser
#
# The users can answer the questions and we store the users data in this model
#
class QuestionUser < ApplicationRecord
  include CSVing

  has_many :question_user_submissions
  belongs_to :country

  default_scope { order("id DESC") }

  ransack_alias :searchable, :email
end
