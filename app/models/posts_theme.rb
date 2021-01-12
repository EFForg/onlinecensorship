# PostsTheme
#
# The admin can add theme for every post
#
class PostsTheme < ApplicationRecord
  has_and_belongs_to_many :posts
  has_many :quotes

  ransack_alias :searchable, translated_search_any(%i(title))

  validates :title, :presence => true

  translates :title
end
