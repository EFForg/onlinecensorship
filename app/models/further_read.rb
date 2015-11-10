# FurtherRead
#
# The admin can add posts in the section further read
#
class FurtherRead < ActiveRecord::Base

  # For use search method
  extend Search

  # Validation
  validates :title, :category ,:author ,:link, :presence => true

end