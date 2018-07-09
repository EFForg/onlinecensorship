# FurtherRead
#
# The admin can add posts in the section further read
#
class FurtherRead < ApplicationRecord

  # For use search method
  extend Search

  # Validation
  validates :title, :category ,:author ,:link, :presence => true

  translates :title, :author, :written_in
  attribute :title
  attribute :author
  attribute :written_in
end
