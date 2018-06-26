# Category
#
# The admin can add category for every post 
#
class Category < ApplicationRecord

  ## DB relations
  has_many :posts

  # For use search method
  extend Search

  # Validation
  validates :title,:color, :presence => true

  translates :title
  attribute :title

end
