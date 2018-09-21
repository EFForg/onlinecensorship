# Story
#
# The admin can add stories
#
class Story < ApplicationRecord

  # For use search method
  extend Search

  belongs_to :icon

  # Validation
  validates :title,:brief, :presence => true

  translates :title, :brief, :content
  attribute :title
  attribute :brief
  attribute :content

  def photo(*args)
    icon.file(*args)
  end
end
