class ContentManagementPagesController < ApplicationController
  before_action :set_content_management_page, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user! , except: [:what_we_do ,:who_we_are ,:appeal ,:privacy]
  layout 'backend', except: [:what_we_do ,:who_we_are , :appeal ,:privacy]

  def index
    respond_to do |format|
      # Using it in the backEnd to allow the admin to show and navigate all the model data
      format.html {
        results=ContentManagementPage.search(params[:search],'page','content')
        @content_management_pages=results.page(params[:page])
        @count=results.count      
      }
      # Using it to export excel file 
      format.xls {
        @content_management_pages = ContentManagementPage.all
      }
    end
  end

  def new
    @content_management_page = ContentManagementPage.new
  end

  def create
    @content_management_page = ContentManagementPage.new(content_management_page_params)
    if @content_management_page.save
      redirect_to admin_content_management_pages_url, notice: 'The page was successfully created.'
    else
      render :new, notice: @content_management_page.errors
    end
  end

  def update
    if @content_management_page.update(content_management_page_params)
      redirect_to admin_content_management_pages_url, notice: 'The page was successfully updated.'
    else
      render :edit, notice: @content_management_page.errors
    end
  end

  def destroy
    page_title = @content_management_page.page_title
    msg =  if @content_management_page.destroy
             { notice: "#{page_title} successfully deleted." }
           else
             { flash: { error: "#{page_title} could not be deleted" } }
           end
    redirect_to admin_content_management_pages_url, **msg
  end

  # CMS pages methods
  def what_we_do
  end

  def who_we_are
    # Get the team and advisors
    @person=Person.all
    @team=@person.where(:team=>true).order(:theorder => :asc)
    @advisors=@person.where(:advisor=>true).order(:theorder => :asc)
  end
  
  def privacy
  end

  def appeal
    @appeal_pages = ContentManagementPage.where(appeal_page: true)
  end

  private
    def set_content_management_page
      @content_management_page = ContentManagementPage.find(params[:id])
    end

    def content_management_page_params
      params.require(:content_management_page).permit(:page, :page_title, :brief, :content, :appeal_page)
    end
end
