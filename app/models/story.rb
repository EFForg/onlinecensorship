# Story
#
# The admin can add stories
#
class Story < ApplicationRecord

  # For use search method
  extend Search

  # Define attachments
  ## The post photo # min-height: 490px
  has_attached_file :photo, :styles => { :thumb => '160x160#' },
                           :default_url => "/:style_default_post.jpg"
  ## Attachments Validation
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
  validates_attachment_size :photo, :less_than => 1.megabyte

  # Validation
  validates :title,:brief, :presence => true

  translates :title, :brief, :content
  attribute :title
  attribute :brief
  attribute :content
end
