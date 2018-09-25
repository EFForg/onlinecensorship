# Quote
#
# The every post can have quote 
#
class Quote < ApplicationRecord

  ## DB relations
  has_and_belongs_to_many :posts_themes, through: :quotes_posts_themes
  has_and_belongs_to_many :social_media_platforms, through: :quotes_social_media_platforms

  ransack_alias :searchable, translated_search(%i(author quote))

  # change the id order
  default_scope { order("id DESC") }

  # Validation
  validates :author,:font_size,:quote, :presence => true

  translates :author, :quote, :twitter_text
  attribute :author
  attribute :quote
  attribute :twitter_text
end
