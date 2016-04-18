# ContactsTopic
#
# The admin can add topics and the topics will appear to the users in drop down menu
#
class ContactsTopic < ActiveRecord::Base

  ## DB relations
  has_many :contacts

  # For use search method
  extend Search

  # Validation
  validates :name, :presence => true

  translates :name

end