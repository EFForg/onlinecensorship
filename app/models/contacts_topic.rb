# ContactsTopic
#
# The admin can add topics and the topics will appear to the users in drop down menu
#
class ContactsTopic < ApplicationRecord

  ## DB relations
  has_many :contacts

  ransack_alias :searchable, translated_search_any(%i(name))

  # Validation
  validates :name, :presence => true

  translates :name
  attribute :name
end
