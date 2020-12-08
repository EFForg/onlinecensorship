# PostsThemesQuote
#
# The admin can assign multi themes for ever quote so we using this model in this relation 
#
class PostsThemesQuote < ApplicationRecord
 	belongs_to :quote
  belongs_to :posts_theme

  validates :quote_id,:posts_theme_id, :presence => true
end
