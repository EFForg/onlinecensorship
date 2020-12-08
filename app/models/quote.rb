# Quote
#
# The every post can have quote 
#
class Quote < ApplicationRecord
  has_and_belongs_to_many :posts_themes, through: :quotes_posts_themes
  has_and_belongs_to_many :social_media_platforms, through: :quotes_social_media_platforms

  ransack_alias :searchable, translated_search_any(%i(author quote))

  default_scope { order("id DESC") }

  validates :author,:font_size,:quote, :presence => true

  translates :author, :quote, :twitter_text
end
