# Notification
#
# The admin can add stuff emails to the notifications system
#
class Notification < ApplicationRecord
  ransack_alias :searchable, %w(email name).join('_or_')

  # Validation
  validates :name, :presence => true
  validates :email, presence: true, uniqueness: true,
                    format: { with: URI::MailTo::EMAIL_REGEXP,
                              message: "Please submit a valid email address" }
end
