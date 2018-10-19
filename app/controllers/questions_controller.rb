class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user! , except: [:submit, :ty]
  before_action :filter_spam , only: [:submit]
  layout 'backend', except: [:submit, :ty]

  def index
    @collection, @count, @query = backend_index(Question)
  end

  def related_questions
    ######################################################################
    # Related Question method
    # we use it in the backEnd to get all the questions related with one option
    ######################################################################
    @questions = Question.all
    render :layout => false
  end

  def related_options
    ######################################################################
    # Related Options method
    # we use it in the backEnd to get all the options related with question
    ######################################################################
    @related_options = QuestionOption.where(:question_id => params[:depend_on_question_id])
    render :layout => false
  end

  # post... and get.... /thanks
  def submit
    ######################################################################
    # Submit method
    # the thanks page that appears to the visitors after answering the survey questions
    ######################################################################

    return unless params[:question]

    if params[:question]

      # insert the user data
      # params[:static_2] = email
      # params[:static_3] = accept to use submission in a case study or not
      # params[:static_4] = pgp key
      # params[:static_5] = other communication
      @question_user = QuestionUser.new(:contact => params[:static_1], :email => params[:static_2], :pgp_key => params[:static_4], :communication_preference => params[:static_5], :case_study => params[:static_3], :age => params[:user_age], :language => params[:locale])
      @question_user.save

      # get the questions id's and the answers values
      params[:question].each_pair do |question_id,value|

        # In the new approach we added 3 questions static at the end of the questionnaire so we check here if this question one if them we escape it
        if !question_id.include? "static"

          # get the question page id
          question_page(question_id)

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
            uploaded_file = params["question"][question_id]
            @uf = UploadedFile.create(title: uploaded_file.original_filename,
              question_answer_id: question_id,
              the_file: uploaded_file)
            add_question_answer(question_id,@question_user_submission.id,@uf.id,nil,nil,nil,nil,nil)
          elsif question_type=="select"
            # insert the answer data
            # add_question_answer needed params [question_id,question_user_id,uploaded_file_id,question_option_id,other_option_answer,country_id,language_id,answer_text]
            add_question_answer(question_id,@question_user_submission.id,nil,value,nil,nil,nil,nil)
          elsif question_type=="multi_select" || question_type=="platform_select"
            # check if there's other answer
            if params[:"other_#{question_id}"] != ""
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

      end

      # Call notify mailer method to notify the admin,
      # which will send the email template located in views/mailer/notify.html.erb
      # notify method need params [user name ,form,data,notification kind, email subject]
      if params[:static_2] !=""
        data="<br> <b> User data: </b>"+params[:static_2].to_s+"<br/>"
        Mailer.notify("","submit report",data,"submit_report","[OC notification System] Report Submission")
      else
        data="<br> <b> User data: </b> Anonymous <br/>"
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

        ## delete the record, paperclip will delete the file
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
      params.require(:question).permit(:question_title, :question_type ,
        :other_answer ,:prompt_text, :required_field,
        :placeholder, :upload_file, :multi_select,
        question_options_attributes:
          [:id,:question_id,:next_page,:dependent_on_question_id,:option_title,:_destroy])
    end
end
