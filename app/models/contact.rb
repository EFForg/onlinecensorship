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
  validates :email, presence: true, uniqueness: true,
                    format: { with: URI::MailTo::EMAIL_REGEXP,
                              message: "Please submit a valid email address" }
end
