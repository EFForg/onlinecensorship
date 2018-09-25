class PostsThemesController < ApplicationController
  before_action :set_posts_theme, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  layout 'backend'

  def index
    backend_index(PostsTheme)
  end

  def new
    @posts_theme = PostsTheme.new
  end

  def create
    @posts_theme = PostsTheme.new(posts_theme_params)
    if @posts_theme.save
      redirect_to admin_posts_themes_url, notice: 'The theme was successfully created.'
    else
      render :new, notice: @posts_theme.errors
    end
  end

  def update
    if @posts_theme.update(posts_theme_params)
      redirect_to admin_posts_themes_url, notice: 'The theme was successfully updated.'
    else
      render :edit, notice: @posts_theme.errors
    end
  end

  def destroy
    # Unpublish all the related posts
    Post.where(:posts_theme_id=>@posts_theme.id).update_all(:published => false)
    # Delete the category
    @posts_theme.destroy
    redirect_to admin_posts_themes_url, notice: 'The theme was successfully destroyed.'
  end

  private
    def set_posts_theme
      @posts_theme = PostsTheme.find(params[:id])
    end

    def posts_theme_params
      params.require(:posts_theme).permit(:title)
    end
end
