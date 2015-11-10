# Story
#
# The admin can add stories 
#
class Story < ActiveRecord::Base

  # For use search method
  extend Search
  
  # Define attachments
  ## The post photo # min-height: 490px
  has_attached_file :photo, :styles => { :thumb => '352x352#' },
                           :url => "/system/story/:style_:basename_:id.:extension",
                           :path => ":rails_root/public/system/story/:style_:basename_:id.:extension",
                           :default_url => "/system/:style_default_post.jpg"
  ## Attachments Validation
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
  validates_attachment_size :photo, :less_than => 1.megabyte

  # Validation
  validates :title,:brief, :presence => true

end