# Contact
#
# It's used for contact us form in the front-end and
#
class Contact < ApplicationRecord
  ## DB relations
  belongs_to :contacts_topic

  # For use search method
  extend Search

  # change the id order
  default_scope { order("id DESC") }

  # Validation
  validates :name,:surname,:message, :presence => true
  validates :email,
          	presence: true,
          	format: {
            	with: /[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}\z/,
            	message: "Error email format"
          	}

end