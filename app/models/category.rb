# Category
#
# The admin can add category for every post 
#
class Category < ActiveRecord::Base

  ## DB relations
  has_many :posts

  # For use search method
  extend Search

  # Validation
  validates :title,:color, :presence => true

  translates :title

end