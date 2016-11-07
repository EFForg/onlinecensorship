class PlatformLinksController < ApplicationController
	before_action :set_platform_link, only: [:edit, :update, :destroy]
  before_action :authenticate_user!
  layout 'backend'

  def index
    respond_to do |format|
      # Using it in the backEnd to allow the admin to show and navigate all the model data
      format.html {
        @platform_links = PlatformLink.all
      }
    end    
  end

  def new
    @platform_link = PlatformLink.new
  end

  def create
    @platform_link = PlatformLink.new(platform_link_params)
    if @platform_link.save
      redirect_to admin_platform_links_url, notice: 'The link was successfully created.'
    else
      render :new, notice: @platform_link.errors
    end
  end

  def update
    if @platform_link.update(platform_link_params)
      redirect_to admin_platform_links_url, notice: 'The link was successfully updated.'
    else
      render :edit, notice: @platform_link.errors
    end
  end

  def destroy
    @platform_link.destroy
    redirect_to admin_platform_links_url, notice: 'The link was successfully destroyed.'
  end

  private
    def set_posts_theme
      @platform_link = PlatformLink.find(params[:id])
    end

    def posts_theme_params
      params.require(:platform_link).permit(:platform_name, :support_link, :help_link)
    end
end
