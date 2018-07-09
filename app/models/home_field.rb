# HomeField "home page data"
#
# The admin can change the home page data texts from this model 
#
class HomeField < ApplicationRecord

  # Validation
  validates :what_oc_title, :what_oc_text, :appeal_text, :appeal_btn_text ,:submit_btn_text , :presence => true

  translates :slogan, :what_oc_title, :what_oc_text, :appeal_text, :appeal_btn_text, :submit_btn_text
  attribute :slogan
  attribute :what_oc_title
  attribute :what_oc_text
  attribute :appeal_text
  attribute :appeal_btn_text
  attribute :submit_btn_text
end
