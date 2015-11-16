# SocialMediaPlatformst
#
# The admin can add social media platforms to allow the visitors to send there issues about it
#
class SocialMediaPlatform < ActiveRecord::Base

  ## DB relations
  has_many :pages
  has_many :posts
  has_many :quotes


  # For use search method
  extend Search

  # For gem FriendlyId
  extend FriendlyId
  friendly_id :title, use: :slugged

  # Define attachments
  ## The post photo
  has_attached_file :logo, :styles => { :small => '80x80#'},
                           :default_url => "/system/:style_default_social_logo.png"
  ## Attachments Validation
  validates_attachment_content_type :logo, :content_type => /\Aimage\/.*\Z/
  validates_attachment_size :logo, :less_than => 1.megabyte

  # Validation
  validates :title,:color,:font_awesome_style, :presence => true


end
