# People
#
# The People in this site can be "team members , posts authors or advisors"
#
class Person < ApplicationRecord
  has_many :posts
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_attached_file :photo, :styles => { :thumb => '200x200#'},
                            :default_url => "/:style_default_people.jpg"
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
  validates_attachment_size :photo, :less_than => 1.megabyte

  validates :name, :bio, :presence => true

  translates :name, :bio, :role

  ransack_alias :searchable, translated_search_any(%i(name bio role))
end
