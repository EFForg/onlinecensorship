# PostsSocialMediaPlatform
#
# The admin can assign multi platforms for ever quote so we using this model in this relation 
#
class QuotesSocialMediaPlatform < ApplicationRecord
 	belongs_to :quote
  belongs_to :social_media_platform
  validates :quote_id,:social_media_platform_id, :presence => true
end
