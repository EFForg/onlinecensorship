# Category
#
# The admin can add category for every post 
#
class Category < ApplicationRecord

  ## DB relations
  has_many :posts

  ransack_alias :searchable, translated_search_any(%i(title))

  # Validation
  validates :title,:color, :presence => true

  translates :title
  attribute :title

end
