# PostsTheme
#
# The admin can add theme for every post
#
class PostsTheme < ActiveRecord::Base

  ## DB relations
  has_and_belongs_to_many :posts
  has_many :quotes

  # For use search method
  extend Search

  # Validation
  validates :title, :presence => true

end
