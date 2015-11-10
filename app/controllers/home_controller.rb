class HomeController < ApplicationController
  layout 'backend', only: [:dashboard]
  before_action :authenticate_user! , only: [:dashboard]

  def index
    @home_fields=HomeField.last
    @all_posts=Post.where(:published=>true)
    @featured_post = @all_posts.where(:featured=>true).first
    if @featured_post
      # show only the pinned posts and disable reviewing the featured post
      @posts = @all_posts.where.not(:id => @featured_post.id).where(:pinned=>true)
    else
      # show only the pinned posts
      @posts = @all_posts.where(:pinned=>true)
    end
    @stories = Story.where(:published=>true)
  end

  # BackEnd dashboard
  def dashboard
    posts = Post.all
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

  end

end