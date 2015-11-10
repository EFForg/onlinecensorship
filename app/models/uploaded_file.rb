# UploadedFiles
#
# The admin can add question as upload file
#
class UploadedFile < ActiveRecord::Base

	## DB relations
	has_one :question_answer

	# Validation
	validates :title,:question_answer_id, :presence => true

end