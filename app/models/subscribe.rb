# Subscribe
#
# The Subscribe form in the forntEnd
#
class Subscribe < ApplicationRecord

  # For use search method
  extend Search

  # Validation
  validates :email,
          	presence: true,
         		uniqueness: true,
          	format: {
            	with: /[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}\z/,
            	message: "Error email format"
          	}

end