# Notification
#
# The admin can add stuff emails to the notifications system
#
class Notification < ApplicationRecord

  # For use search method
  extend Search

  # Validation
  validates :name, :presence => true
  validates :email, presence: true, uniqueness: true,
                    format: { with: URI::MailTo::EMAIL_REGEXP,
                              message: "Please submit a valid email address" }
end
