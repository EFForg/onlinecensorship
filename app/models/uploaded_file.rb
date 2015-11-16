# UploadedFiles
#
# The admin can add question as upload file
#
class UploadedFile < ActiveRecord::Base

	## DB relations
	has_one :question_answer

	# Validation
	validates :title,:question_answer_id, :presence => true

	has_attached_file :the_file, :styles => { :thumb => '200x200#'},
                            :url => "/system/uploads/:style_:basename_:id.:extension",
                            :path => ":rails_root/public/system/uploads/:style_:basename_:id.:extension",
                            :default_url => "/system/:style_default_people.jpg"

	## Attachments Validation
  validates_attachment_content_type :the_file, :content_type => /\Aimage\/.*\Z/
  validates_attachment_size :the_file, :less_than => 4.megabyte
end
