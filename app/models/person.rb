# People
#
# The People in this site can be "team members , posts authors or advisors"
#
class Person < ApplicationRecord

  ## DB relations
  has_many :posts

  # For use search method
  extend Search

  # For gem FriendlyId
  extend FriendlyId
  friendly_id :name, use: :slugged

  # Define attachments
  ## The employee photo
  has_attached_file :photo, :styles => { :thumb => '200x200#'},
                            :default_url => "/:style_default_people.jpg"
  ## Attachments Validation
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
  validates_attachment_size :photo, :less_than => 1.megabyte

  # Validation
  validates :name, :bio, :presence => true

  translates :name, :bio, :role
  attribute :name
  attribute :bio
  attribute :role
end
