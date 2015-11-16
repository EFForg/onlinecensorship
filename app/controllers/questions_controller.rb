class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user! , except: [:submit, :ty]
  before_filter :filter_spam , only: [:thanks]
  layout 'backend', except: [:submit, :ty]

  def index
    respond_to do |format|
      # Using it in the backEnd to allow the admin to show and navigate all the model data
      format.html {
        results=Question.search(params[:search],'question_title')
        @questions=results.page(params[:page])
        @count=results.count
      }
      # Using it to export excel file
      format.xls {
        @questions = Question.all
      }
    end
  end

  def related_questions
    ######################################################################
    # Related Question method
    # we use it in the backEnd to get all the questions related with one option
    ######################################################################
    @questions=Question.where(:social_media_platform_id => params[:social_media_platform_id])
    render :layout => false
  end

  def related_options
    ######################################################################
    # Related Options method
    # we use it in the backEnd to get all the options related with question
    ######################################################################
    @related_options=QuestionOption.where(:question_id => params[:depend_on_question_id])
    render :layout => false
  end

  # post... and get.... /thanks
  def submit
    ######################################################################
    # Submit method
    # the thanks page that appear to the visitors after answer the social media questions
    ######################################################################

    return unless params[:question]

    if params[:question]

      # insert the user data
      # params[:static_2] is the question that the user can type his email in it in the new approach
      @question_user = QuestionUser.new(:email => params[:static_2] , :inform_platform => params[:user_country])
      @question_user.save

      # get the questions id's and the answers values
      params[:question].each_pair do |question_id,value|

        # get the question page id
        question_page(question_id,params[:platform_id])

        # insert the user submition data
        @question_user_submission = QuestionUserSubmission.new(:question_user_id => @question_user.id, :page_id => @question_page_id)
        @question_user_submission.save

        # get the questions type by ID
        question_type=question_type(question_id)
        # set the answer id according to the type
        if question_type=="text" || question_type=="long_text" || question_type=="url" || question_type=="email"
          # insert the answer data
          # add_question_answer needed params [question_id,question_user_id,uploaded_file_id,question_option_id,other_option_answer,country_id,language_id,answer_text]
          add_question_answer(question_id,@question_user_submission.id,nil,nil,nil,nil,nil,value)
        elsif question_type=="upload"
          # create and open the dir
          folder_path="public/system/uploads"
          CreateFolder(folder_path)
          # upload the file
          UploadFile(value,folder_path)
          # insert uploaded file data , file_name return from the UploadFile method
          @uploaded_file = UploadedFile.new(:title =>@file_name,:question_answer_id => question_id)
          @uploaded_file.save
          # insert the answer data
          # add_question_answer needed params [question_id,question_user_id,uploaded_file_id,question_option_id,other_option_answer,country_id,language_id,answer_text]
          add_question_answer(question_id,@question_user_submission.id,@uploaded_file.id,nil,nil,nil,nil,nil)
        elsif question_type=="select"
          # insert the answer data
          # add_question_answer needed params [question_id,question_user_id,uploaded_file_id,question_option_id,other_option_answer,country_id,language_id,answer_text]
          add_question_answer(question_id,@question_user_submission.id,nil,value,nil,nil,nil,nil)
        elsif question_type=="multi_select"
          # check if there's other answer
          if params[:"op_#{question_id}"]
            # insert the other answer data
          # add_question_answer needed params [question_id,question_user_id,uploaded_file_id,question_option_id,other_option_answer,country_id,language_id,answer_text]
            add_question_answer(question_id,@question_user_submission.id,nil,nil,params[:"other_#{question_id}"],nil,nil,nil)
          end
          # the question options
          params[:question][question_id].each do |multi_value|
            # insert the answer data
            # add_question_answer needed params [question_id,question_user_id,uploaded_file_id,question_option_id,other_option_answer,country_id,language_id,answer_text]
            add_question_answer(question_id,@question_user_submission.id,nil,multi_value,nil,nil,nil,nil)
          end
        elsif question_type=="countries"
          # insert the answer data
          # add_question_answer needed params [question_id,question_user_id,uploaded_file_id,question_option_id,other_option_answer,country_id,language_id,answer_text]
          add_question_answer(question_id,@question_user_submission.id,nil,nil,nil,value,nil,nil)
        elsif question_type=="languages"
          # insert the answer data
          # add_question_answer needed params [question_id,question_user_id,uploaded_file_id,question_option_id,other_option_answer,country_id,language_id,answer_text]
          add_question_answer(question_id,@question_user_submission.id,nil,nil,nil,nil,value,nil)
        end

      end

      # Call notify mailer method to notify the admin,
      # which will send the email template located in views/mailer/notify.html.erb
      # notify method need params [user name ,form,data,notification kind, email subject]
      if params[:static_2] !=""
        data="<br> <b> User data: </b>"+params[:static_2].to_s+"<br> <b> Platform: </b>"+getSocialMediaPlatform(@question_page_id).to_s
        Mailer.notify(params[:user_name],"submit report",data,"submit_report","OC submit report form notification system")
      else
        data="<br> <b> User data: </b> Anonymous <br> <b> Platform: </b>"+getSocialMediaPlatform(@question_page_id).to_s
        Mailer.notify("Anonymous","submit report",data,"submit_report","[OC notification System] Report Submission")
      end
      ####
      redirect_to action: :ty
    end

  end

  def ty
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to admin_questions_url, notice: 'The question was successfully created.'
    else
      render :new , notice: @question.errors
    end
  end

  def update
    if @question.update(question_params)
      redirect_to admin_questions_url, notice: 'The question was successfully updated.'
    else
      render :edit , notice: @question.errors
    end
  end

  def destroy

    # delete the question options
    QuestionOption.where(:question_id => @question.id).destroy_all

    # delete the uploaded answer files
      if @question.question_type=="upload"

        QuestionAnswer.where(:question_id => @question.id).each do |answer|

          ## get my file name
          file_name=UploadedFile.where(:id =>answer.uploaded_file_id).first.title

          if file_name && File.exist?(file_name)
            ## delete the file from the server
            File.delete("public/system/uploads/"+file_name.to_s)
          end

          ## delete the file from the DB
          UploadedFile.where(:question_answer_id => answer.id).destroy_all

        end
      end

    # delete the question answers
    QuestionAnswer.where(:question_id => @question.id).destroy_all

    @question.destroy
    redirect_to admin_questions_url, notice: 'The question was successfully destroyed.'
  end

  private

    # for filtering forms from spam
    def filter_spam
      if !params[:spam_checker].blank?
        redirect_to root_path
        return false
      end
    end

    def set_question
      @question = Question.find(params[:id])
    end

    def question_params
      params.require(:question).permit(:question_title, :question_type , :other_answer ,:prompt_text, :prompt_link, :required_field ,:placeholder , question_options_attributes: [:id,:question_id,:next_page,:dependent_on_question_id,:option_title,:_destroy])
    end
end
