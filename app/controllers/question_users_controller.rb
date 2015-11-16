class QuestionUsersController < ApplicationController
  before_action :set_question_user, only: [:show]
  before_action :authenticate_user!
  layout 'backend'

  def index
    respond_to do |format|
      # Using it in the backEnd to allow the admin to show and navigate all the model data
      format.html {
        results=QuestionUser.search(params[:search],'email')
        @question_users=results.page(params[:page])
        @count=results.count
      }
      # Using it to export excel file
      format.xls {
        @question_users = QuestionUser.all
      }
    end    
  end
  
  private
    def set_question_user
      @question_user = QuestionUser.find(params[:id])
    end

    def question_user_params
      params.require(:question_user).permit(:inform_platform, :email)
    end
end
