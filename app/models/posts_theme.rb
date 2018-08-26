# PostsTheme
#
# The admin can add theme for every post
#
class PostsTheme < ApplicationRecord

  ## DB relations
  has_and_belongs_to_many :posts
  has_many :quotes

  # For use search method
  extend Search

  # Validation
  validates :title, :presence => true

  translates :title
  attribute :title
end
