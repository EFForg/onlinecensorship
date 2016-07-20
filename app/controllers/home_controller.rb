class HomeController < ApplicationController
  layout 'backend', only: [:dashboard]
  before_action :authenticate_user! , only: [:dashboard]

  def index
    @home_fields = HomeField.last
    @all_posts = Post.where(:published=>true).order("id DESC")

    if I18n.locale != :en
      @translated_posts = Post.with_translations(I18n.locale).where(:published=>true).order("id DESC").limit(7)
      @other_posts = Post.where(:published=>true).order("id DESC").where(:pinned=>true).limit(7)
      #@all_posts = @translated_posts + @other_posts
      posts = @translated_posts + @other_posts
      @posts = posts.uniq
    else
      # binding.pry
      @featured_post = Post.where(:published=>true).where(:featured=>true).order("updated_at DESC").first
      # binding.pry
      if @featured_post
        # show only the pinned posts and disable reviewing the featured post
        @posts = @all_posts.where.not(:id => @featured_post.id).where(:pinned=>true).limit(7)
      else
        # show only the pinned posts
        @posts = @all_posts.where(:pinned=>true).limit(9)
      end
    end
    @stories = Story.where(:published=>true)
  end

  # BackEnd dashboard
  def dashboard
    posts = Post.all.order("id DESC")
    @latest_posts = posts.where(published: true).limit(5)
    @draft_posts = posts.where(published: false).limit(5)
    @pinned_posts = posts.where(published: true).where(pinned: true).limit(5)
    @featured_post = posts.where(published: true).where(featured: true).first
    @pages = ContentManagementPage.all
    @people = Person.limit(6)
    @quotes = Quote.limit(5)
    stories = Story.all
    @published_stories = stories.where(published: true).limit(5)
    @unpublished_stories = stories.where(published: false).limit(5)
  end

  # Error page
  def error
    respond_to do |format|
      format.html { }
      format.all { redirect_to root_path }
    end
  end

end