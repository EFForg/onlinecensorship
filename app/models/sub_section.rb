class SubSection < ApplicationRecord
	belongs_to :section

	has_attached_file :icon, :styles => { :thumb => '36x36#'},
                            :default_url => "/:style_missing.jpg"
  validates_attachment_content_type :icon, :content_type => /\Aimage\/.*\Z/

  validates :title, :content, presence: true

  translates :title, :content
end
