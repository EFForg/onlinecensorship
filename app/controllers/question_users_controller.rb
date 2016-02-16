class QuestionUsersController < ApplicationController
  before_action :authenticate_user!
  layout 'backend'

  def index
    respond_to do |format|
      # Using it in the backEnd to allow the admin to show and navigate all the model data
      format.html {
        results=QuestionUser.search(params[:search],'email')
        @question_users=results.page(params[:page])
        @count=results.count
        @social_media_platforms = SocialMediaPlatform.all
      }
      # Using it to export excel file
      format.xls {
        @question_users = QuestionUser.all
      }
    end
  end

  def show
    # an iteration pattern takes place in show.html.erb populating many instance
    # variables
    @question_user = QuestionUser.find(params[:id])
  end

  private

    def question_user_params
      params.require(:question_user).permit(:inform_platform, :email)
    end
end
