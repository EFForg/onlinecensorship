# UploadedFiles
#
# The admin can add question as upload file
#
class UploadedFile < ApplicationRecord
	has_one :question_answer

	validates :title,:question_answer_id, :presence => true

	has_attached_file :the_file, :styles => { :thumb => '200x200#'},
														s3_permissions: :private,
														default_url: "/missing.png"
  validates_attachment_content_type :the_file, :content_type => /\Aimage\/.*\Z/
  validates_attachment_size :the_file, :less_than => 4.megabyte
end
