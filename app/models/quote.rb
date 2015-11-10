# Quote
#
# The every post can have quote 
#
class Quote < ActiveRecord::Base

  ## DB relations
  has_and_belongs_to_many :posts_themes, through: :quotes_posts_themes
  has_and_belongs_to_many :social_media_platforms, through: :quotes_social_media_platforms

  # For use search method
  extend Search

  # change the id order
  default_scope { order("id DESC") }

  # Validation
  validates :author,:font_size,:quote, :presence => true

end