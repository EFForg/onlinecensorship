# PostsSocialMediaPlatform
#
# The admin can assign multi platforms for ever post so we using this model in this relation 
#
class PostsSocialMediaPlatform < ApplicationRecord

  ## DB relations
 	belongs_to :post
  belongs_to :social_media_platform

  # Validation
  validates :post_id,:social_media_platform_id, :presence => true

end