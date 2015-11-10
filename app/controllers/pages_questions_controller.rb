class PagesQuestionsController < ApplicationController
  before_action :set_page_questions, only: [:destroy]

  def destroy
    @Pages_question.destroy
		render :nothing => true   
  end

  private
    def set_page_questions
      @Pages_question = PagesQuestion.find(params[:id])
    end
end