# PostsPostsTheme
#
# The admin can assign multi themes for ever post so we using this model in this relation 
#
class PostsPostsTheme < ApplicationRecord
 	belongs_to :post
  belongs_to :posts_theme

  validates :post_id,:posts_theme_id, :presence => true
end
