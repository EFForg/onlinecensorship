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

        # platform = SocialMediaPlatform.where(:id=>params[:platform]).first
        # @questions = []
        # if platform.pages.present?
        #   platform.pages.order(:theorder => :asc).each do |page|
        #     if page.pages_questions.present?
        #       # get the questions
        #       page.pages_questions.each do |page_question|
        #         if page_question.question.present?
        #           #  the questions
        #           @questions << page_question.question.question_title.gsub('{platform}',platform.title)
        #
        #         end
        #       end
        #
        #       # get the answers
        #       if page.question_user_submissions.present?
        #
        #       end
        #
        #     end
        #   end
        # end

        # @platform = SocialMediaPlatform.where(:id=>params[:platform]).first
        # @questions = []
        # @question_users = QuestionUser.all
        # @question_users.each do |question_user|
        #   if question_user.question_user_submissions.present?
        #     # Get the user submission
        #     question_user.question_user_submissions.each do |submission|
        #       # Get the same platform pages
        #       if submission.page.present? && submission.page.social_media_platform.id == @platform.id
        #         #  the questions
        #         question = submission.question_answer.question.question_title.gsub('{platform}',submission.page.social_media_platform.title)
        #         @questions << question unless @questions.include?(question)
        #       end
        #     end
        #   end
        # end

        @questions = []
        @question_users = []
        @platform = SocialMediaPlatform.where(:id=>params[:platform]).first
        # Get the platform users
        QuestionUser.all.each do |question_user|
          if question_user.question_user_submissions.present?
            question_user.question_user_submissions.each do |submission|
              if submission.page.present? && submission.page.social_media_platform.id == @platform.id
                @question_users << question_user unless @question_users.include?(question_user)
              end
            end
          end
        end

        @question_users.each do |question_user|
          question_user.question_user_submissions.each do |submission|
            #  the questions
            question = submission.question_answer.question.question_title.gsub('{platform}',submission.page.social_media_platform.title)
            @questions << question unless @questions.include?(question)
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
