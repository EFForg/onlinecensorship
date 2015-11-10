# Notification
#
# The admin can add stuff emails to the notifications system
#
class Notification < ActiveRecord::Base

  # For use search method
  extend Search

  # Validation
  validates :name, :presence => true
  validates :email,
          	presence: true,
         		uniqueness: true,
          	format: {
            	with: /[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}\z/,
            	message: "Error email format"
          	}
end