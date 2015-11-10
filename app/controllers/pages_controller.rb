class PagesController < ApplicationController
  before_action :set_page, only: [:show, :edit, :update, :destroy , :update_page]
  before_action :authenticate_user!
  layout 'backend'

  def index
    if params[:request_type]=="registerd_pages"    
      # We using it to get the registerd pages for the selected platform by ajax request in backEnd
      @pages=Page.where(:social_media_platform_id=>params[:social_media_platform_id]).order(:theorder => :asc);
      render :layout => false
    else
      # We using it to add pages by ajax from the backEnd
      @page =Page.create(:social_media_platform_id => params[:social_media_platform_id])
      @page.save
      @last_id=@page.id
      @pages=[]
    end
  end

  def update_page
    # We using it to update pages order number by ajax from the backEnd
    @update=@page.update_attributes(:theorder=> params[:theorder])
  end

  def new
    @page = Page.new
    @social_media_platforms = SocialMediaPlatform.all
    # to reload the registerd pages if we refreshed the page
    if params[:platform]
      @current_platform = @social_media_platforms.where(:id =>params[:platform]).first
      @pages=Page.where(:social_media_platform_id=>params[:platform]).order(:theorder => :asc);
    end
  end

  def pages_questions
    # We using it to get the pages questions in the backEnd popup page
    @questions = Question.all
    @relate_questions=@questions.where(:question_type=>["select","multi_select"]).all
    if params[:page_question_id]
      @question = PagesQuestion.where(:id =>params[:page_question_id]).first
      @related_options=QuestionOption.where(:question_id => @question.dependent_on_question)
    end
  end

  def create
    ######################################################################
    # Create new page
    # We using this method to assign questions for the slides pages
    ######################################################################
    if params[:page_question_id]
      # now update the registered question
      @update=PagesQuestion.find_by(id: params[:page_question_id])
      @update.update_attributes(question_id: params[:question],page_id: params[:page_id],dependent_on_question: params[:depend_on_question_id],question_option_id: params[:question_option])
    else 
      # check if the question assigned before 
      @check=PagesQuestion.where(:question_id => params[:question]).where(:page_id => params[:page_id]).first
      if @check == nil
        # Add new question to the slide page       
        @add_new_question=PagesQuestion.create(:question_id=>params[:question],:page_id=>params[:page_id],:dependent_on_question=>params[:depend_on_question_id],:question_option_id=>params[:question_option])
        @add_new_question.save
      end
    end
    render :nothing => true
  end

  def destroy
    @page.destroy
    render :nothing => true
  end

  private
    def set_page
      @page = Page.find(params[:id])
    end

    def page_params
      params.require(:page).permit(:social_media_platform_id,:theorder)
    end
end
