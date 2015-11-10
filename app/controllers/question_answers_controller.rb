class QuestionAnswersController < ApplicationController

  private

    def question_answer_params
      params.require(:question_answer).permit(:question_user_submission_id, :question_id, :uploaded_file_id, :question_option_id ,:other_option_answer , :country_id, :language_id, :answer_text)
    end
end