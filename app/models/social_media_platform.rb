# SocialMediaPlatformst
#
# The admin can add social media platforms to allow the visitors to send there issues about it
#
class SocialMediaPlatform < ApplicationRecord
  has_many :posts
  has_many :quotes

  ransack_alias :searchable, translated_search_any(%i(title))

  extend FriendlyId
  friendly_id :title, use: :slugged

  has_attached_file :logo, :styles => { :small => '80x80#'},
                           :default_url => "/:style_default_social_logo.png"
  validates_attachment_content_type :logo, :content_type => /\Aimage\/.*\Z/
  validates_attachment_size :logo, :less_than => 1.megabyte

  validates :title,:color,:font_awesome_style, :presence => true

  translates :title
end
