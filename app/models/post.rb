# Post
#
# The admin can add posts for every category
#
class Post < ApplicationRecord
  belongs_to :person
  belongs_to :category
  has_and_belongs_to_many :posts_themes, through: :posts_posts_themes
  has_and_belongs_to_many :social_media_platforms, through: :posts_social_media_platforms

  translates :title, :description, :intro, :tags, :side_image_caption, 
    :quote_author, :quote_text, :twitter_text, :news_source, :image_author_name,
    :pdf_file_name, :pdf_content_type, :pdf_file_size, :pdf_updated_at,
    :fallbacks_for_empty_translations => true

  ransack_alias :searchable, translated_search_any(%i(title description))

  extend FriendlyId
  friendly_id :title, use: :slugged

  has_attached_file :photo, :styles => { :thumb => '375x490#' },
                           :default_url => "/:style_default_post_image.jpg"
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
  validates_attachment_size :photo, :less_than => 1.megabyte

  has_attached_file :side_image, :default_url => "/default_post_side_image.jpg"
  validates_attachment_content_type :side_image, :content_type => /\Aimage\/.*\Z/
  validates_attachment_size :side_image, :less_than => 1.megabyte

  has_attached_file :pdf
  ## Attachments Validation
  # validates_attachment_content_type :pdf, content_type: ['image/jpeg', 'image/png', 'application/pdf']
  # validates_attachment_size :pdf, :less_than => 100.megabyte

  validates :title,:intro,:category_id, :presence => true
end
