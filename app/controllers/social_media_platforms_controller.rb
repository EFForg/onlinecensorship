class SocialMediaPlatformsController < ApplicationController
  before_action :set_social_media_platform, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user! , except: [:submit_report ,:submit_report_show]
  layout 'backend', except: [:submit_report ,:submit_report_show]

  def index
    respond_to do |format|
      # Using it in the backEnd to allow the admin to show and navigate all the model data
      format.html {
        results=SocialMediaPlatform.search(params[:search],'title')
        @social_media_platforms=results.page(params[:page])
        @count=results.count
      }
      # Using it to export excel file
      format.xls {
        @social_media_platforms=SocialMediaPlatform.all
      }
    end
  end

  def submit_report
    @platforms=SocialMediaPlatform.all
  end

  def submit_report_show
    @countries=Country.order("name ASC")
    @languages=Language.order("name ASC")
    @pages = Page.order(:theorder => :asc)
    render :layout => "report"
  end

  def new
    @social_media_platform = SocialMediaPlatform.new
  end

  def create
    @social_media_platform = SocialMediaPlatform.new(social_media_platform_params)
    if @social_media_platform.save
      redirect_to admin_social_media_platforms_url, notice: 'The social platform was successfully created.'
    else
      render :new , notice: @social_media_platform.errors
    end
  end

  def update
    if @social_media_platform.update(social_media_platform_params)
      redirect_to admin_social_media_platforms_url, notice: 'The social platform was successfully updated.'
    else
      render :edit , notice: @social_media_platform.errors
    end
  end

  def destroy
    # Unpublish all the related posts
    @posts=Post.joins(:social_media_platforms).where('posts_social_media_platforms.social_media_platform_id' => @social_media_platform.id)
    @posts.update_all(:published => false)
    # Delete the category
    @social_media_platform.destroy
    redirect_to admin_social_media_platforms_url, notice: 'The social platform was successfully destroyed.'
  end

  private
    def set_social_media_platform
      @social_media_platform = SocialMediaPlatform.friendly.find(params[:id])
    end

    def social_media_platform_params
      params.require(:social_media_platform).permit(:title,:logo,:color,:font_awesome_style)
    end
end
