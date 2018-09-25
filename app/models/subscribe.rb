# Subscribe
#
# The Subscribe form in the forntEnd
#
class Subscribe < ApplicationRecord
  ransack_alias :searchable, :email

  # Validation
  validates :email, presence: true, uniqueness: true,
                    format: { with: URI::MailTo::EMAIL_REGEXP,
                              message: "Please submit a valid email address" }

end
