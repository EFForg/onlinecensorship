# ContentManagementPage
#
# The admin can manage and change the cms pages content from the backEnd
#
class ContentManagementPage < ApplicationRecord

  # For use search method
  extend Search

  # Validation
  validates :page_title, :content, :presence => true

  translates :content, :brief, :page_title
  attribute :content
  attribute :brief
  attribute :page_title
end
