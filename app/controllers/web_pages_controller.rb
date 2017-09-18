class WebPagesController < ApplicationController
	before_action :set_page, only: [:show, :edit, :update, :destroy , :update_page, :update_message]
  before_action :authenticate_user!, except: [:show]

  layout 'backend', except: [:show]

  def index
  	@web_pages = WebPage.all
  end

  def new
    @web_page = WebPage.new
    @web_pages = WebPage.order(:theorder => :asc)
  end

  def create
    @web_page = WebPage.new(web_page_params)
    if @web_page.save
      redirect_to web_pages_url, notice: 'The web page was successfully created.'
    else
      render :new, notice: @web_page.errors
    end
  end

  def edit
  end

  def update
    if @web_page.update(web_page_params)
      redirect_to web_pages_url, notice: 'The web page was successfully updated.'
    else
      render :edit, notice: @web_page.errors
    end
  end

  def destroy
    @web_page.destroy
    render :nothing => true
  end

  private
    def set_page
      @web_page = WebPage.friendly.find(params[:id])
    end

    def web_page_params
      params.require(:web_page).permit(:title, :brief, :content, :slug, sections_attributes: [:id, :title, :content, :_destroy, sub_sections_attributes: [:id, :title, :content, :icon, :_destroy]])
    end
end
