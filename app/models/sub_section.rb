class SubSection < ActiveRecord::Base
	belongs_to :section

	has_attached_file :icon, :styles => { :thumb => '36x36#'},
                            :default_url => "/:style_missing.jpg"
  ## Attachments Validation
  validates_attachment_content_type :icon, :content_type => /\Aimage\/.*\Z/

  translates :title, :content
end
