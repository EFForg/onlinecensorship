class QuestionOptionsController < ApplicationController

  private

    def question_option_params
      params.require(:question_option).permit(:question_id, :option_title)
    end
end