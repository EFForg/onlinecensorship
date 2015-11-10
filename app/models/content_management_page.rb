# ContentManagementPage
#
# The admin can manage and change the cms pages content from the backEnd
#
class ContentManagementPage < ActiveRecord::Base

  # For use search method
  extend Search

  # Validation
  validates :page_title, :content, :presence => true

end