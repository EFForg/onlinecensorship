# QuestionUser
#
# The users can answer the questions and we store the users data in this model
#
class QuestionUser < ApplicationRecord

  ## DB relations
  has_many :question_user_submissions
  belongs_to :country

  # change the id order
  default_scope { order("id DESC") }

  # For use search method
  extend Search

  def self.to_csv(options = {})
	  CSV.generate(options) do |csv|
	    csv << column_names
	    all.each do |submission|
	      csv << submission.attributes.values_at(*column_names)
	    end
	  end
	end

end