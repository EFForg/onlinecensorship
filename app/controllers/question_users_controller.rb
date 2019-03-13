class QuestionUsersController < ApplicationController
  before_action :authenticate_user!
  layout 'backend'

  def index
    respond_to do |format|
      # Using it in the backEnd to allow the admin to show and navigate all the model data
      format.html {
        @query = QuestionUser.ransack(params[:q])
        @question_users = @query.result(distinct: true)
        @count = @question_users.count
        @question_users = @question_users.page(params[:page])
      }

      format.csv {
        send_data QuestionUser.to_csv
      }

      # Using it to export excel file
      format.xls {

        # Get report pages
        @pages = Page.order(:theorder => :asc);

        @question_users = []
        @questions = []
        @question_user_submissions = []

        @pages.each do |page|
          # Get the users
          if page.question_user_submissions.present?
            page.question_user_submissions.each do |submission|
              if submission.question_user.present?
                @question_user_submissions << submission unless @question_user_submissions.include?(submission)
                @question_users << submission.question_user unless @question_users.include?(submission.question_user)
              end
            end
          end

          # Get the questions
          if page.pages_questions.present?
            page.pages_questions.each do |pages_question|
              if pages_question.question.present?
                @questions << pages_question.question unless @questions.include?(pages_question.question)
              end
            end
          end
        end
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
