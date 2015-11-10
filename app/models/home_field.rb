# HomeField "home page data"
#
# The admin can change the home page data texts from this model 
#
class HomeField < ActiveRecord::Base

  # Validation
  validates :what_oc_title, :what_oc_text, :appeal_text, :appeal_btn_text ,:submit_btn_text , :presence => true

end