class UploadedFilesController < ApplicationController

  private

    def uploaded_file_params
      params.require(:uploaded_file).permit(:title, :question_answer_id)
    end
end