# PostsThemesQuote
#
# The admin can assign multi themes for ever quote so we using this model in this relation 
#
class PostsThemesQuote < ActiveRecord::Base

  ## DB relations
 	belongs_to :quote
  belongs_to :posts_theme

  # Validation
  validates :quote_id,:posts_theme_id, :presence => true

end