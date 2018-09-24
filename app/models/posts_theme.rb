# PostsTheme
#
# The admin can add theme for every post
#
class PostsTheme < ApplicationRecord

  ## DB relations
  has_and_belongs_to_many :posts
  has_many :quotes

  ransack_alias :searchable, translated_search(%i(title))

  # Validation
  validates :title, :presence => true

  translates :title
  attribute :title
end
