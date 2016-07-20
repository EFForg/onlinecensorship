class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :set_post_id, only: [:publish, :featured , :pinned]
  before_action :authenticate_user! , except: [:index,:author,:show]
  layout 'backend', except: [:index,:author,:show]

  def admin
    ######################################################################
    # Admin method
    # we using it in the backEnd to allow the admin to show and navigate all the model data
    ######################################################################
    results=Post.search(params[:search],'title','description').order("id DESC")
    @posts=results.page(params[:page])
    @count=results.count
  end

  def author
    ######################################################################
    # Author method
    # we using it in the frontEnd to allow the user to show all the author posts
    ######################################################################
    @person = Person.friendly.find(params[:id])
    @posts = Post.where(:person_id=>@person.id).order("id DESC")
  end

  def index
    respond_to do |format|

      # Using it to export excel file
      format.xls {
        @posts = Post.all.order("id DESC")
      }

      # using it in the backEnd and in the frontEnd posts page
      format.any(:js, :html) {
        @posts = Post.where(:published=>true).order("id DESC")
        # featured post
        @featured_post = @posts.where(:featured=>true).first

        # binding.pry
        # all posts without the feature posts
        if @featured_post
          @unfeatured_posts=@posts.where.not(:id => @featured_post.id)
        end

        @quotes = Quote.where(:featured=>true)

        if params[:category_id] !=nil && params[:category_id] !="" && params[:category_id] != "All" && params[:category_id] != "false"
          @posts=@posts.where(:category_id => params[:category_id]);
        end

        if params[:platform_id] !=nil && params[:platform_id] !="" && params[:platform_id] != "All" && params[:platform_id] != "false"
          @posts=@posts.joins(:social_media_platforms).where('posts_social_media_platforms.social_media_platform_id' => params[:platform_id])
          @quotes=@quotes.joins(:social_media_platforms).where('quotes_social_media_platforms.social_media_platform_id' => params[:platform_id])
        end

        if params[:theme_id] !=nil && params[:theme_id] !="" && params[:theme_id] != "All" && params[:theme_id] != "false"
          @posts=@posts.joins(:posts_themes).where('posts_posts_themes.posts_theme_id' => params[:theme_id])
          @quotes=@quotes.joins(:posts_themes).where('posts_themes_quotes.posts_theme_id' => params[:theme_id])
        end

        # Show all posts without limitation
        if params[:category_id] || params[:platform_id] || params[:theme_id]
          @posts =  @posts
          # hide the big block
          @featured_post = nil
        elsif  params[:show_all]
          # to disable duplicate the feature post
          @posts =  @unfeatured_posts
        # Search by tags
        elsif params[:tag]
          @posts = @posts.where("title LIKE ? OR description like ? OR intro like ? OR tags like ? OR side_image_caption like ?", "%#{params[:tag]}%","%#{params[:tag]}%","%#{params[:tag]}%","%#{params[:tag]}%","%#{params[:tag]}%")
        else
          # Start only with 10 posts
          if @unfeatured_posts
            @posts = @unfeatured_posts.order(:id => :desc).limit(10).offset(0);
          end
          @show_all=true
        end

        if I18n.locale != :en
          @translated_posts = Post.with_translations(I18n.locale).where(:published=>true).order("id DESC").limit(7)
          @other_posts = Post.where(:published=>true).order("id DESC").where(:pinned=>true).limit(7)
          #@all_posts = @translated_posts + @other_posts
          posts = @translated_posts + @other_posts
          @posts = posts.uniq
        end

        # Show the categories in filtering drop down menu
        @categories = Category.all
        @platform=SocialMediaPlatform.all
        @theme=PostsTheme.all
      }
    end
  end

  def feed
    @posts = Post.where(:published=>true).order("id DESC")
    respond_to do |format|
      format.rss { render :layout => false }
    end
  end

  def preview
  end

  def publish
    # Unpublish the post "Allow the admin to publish/unpublish the post from the backEnd"
    ReverseField(@post,"published")
    redirect_to admin_posts_path(), notice: 'The post was successfully unpublished.'
  end

  def featured
    # featured the post "Allow the admin to fix/unfix the post from the backEnd"
    ReverseField(@post,"featured")
    redirect_to admin_posts_path(), notice: 'The post was successfully featured.'
  end

  def pinned
    # pinned the post "Allow the admin to fix/unfix the post from the backEnd"
    ReverseField(@post,"pinned")
    redirect_to admin_posts_path(), notice: 'The post was successfully pinned.'
  end

  def show
    @posts = Post.where(category_id: @post.category_id).where("id != ?", @post.id).order("RAND()").limit(3)
  end

  def new
    @post = Post.new
    @categories = Category.all
    @platfroms = SocialMediaPlatform.all
    @themes = PostsTheme.all
    @people = Person.all
  end

  def edit
    @categories = Category.all
    @platfroms = SocialMediaPlatform.all
    @themes = PostsTheme.all
    @people = Person.all
    if @post.category.present?
      @post_type_title=@post.category.title
    end
  end

  def create

    # Create quote
    @quote = Quote.create(:author => post_params["quote_author"], :quote => post_params["quote_text"], :twitter_text => post_params["twitter_text"])
    @quote.save

    @post = Post.new(post_params)
    if @post.save

      # add the post themes
      if params[:theme]
        params[:theme].each do |element|
          theme = PostsTheme.find(element)
          @post.posts_themes << theme unless @post.posts_themes.include?(theme)
          # add quotes themes
          if post_params["quote_text"]
            @quote.posts_themes << theme unless @quote.posts_themes.include?(theme)
          end
        end
      else
        # to handle the empty array error
        @post.posts_themes = []
      end

      # add the post platforms
      if params[:platfrom]
        params[:platfrom].each do |element|
          platform = SocialMediaPlatform.find(element)
          @post.social_media_platforms << platform unless @post.social_media_platforms.include?(platform)
          # add quotes platforms
          if post_params["quote_text"]
            @quote.social_media_platforms << platform unless @quote.social_media_platforms.include?(platform)
          end
        end
      else
        # to handle the empty array error
        @post.social_media_platforms = []
      end

      redirect_to admin_posts_path, notice: 'The post was successfully created, and added to drafts.'

    else
      render :new
    end
  end

  def update
    if @post.update(post_params)

      # update the post themes
      if params[:theme]
        # delete the old data
        @post.posts_themes.delete_all
        # add the new themes
        params[:theme].each do |element|
          theme = PostsTheme.find(element)
          @post.posts_themes << theme unless @post.posts_themes.include?(theme)
        end
      end

      # update the post platforms
      if params[:platfrom]
        # delete the old data
        @post.social_media_platforms.delete_all
        # add the new themes
        params[:platfrom].each do |element|
          platform = SocialMediaPlatform.find(element)
          @post.social_media_platforms << platform unless @post.social_media_platforms.include?(platform)
        end
      end

      redirect_to admin_posts_path, notice: 'The post was successfully updated.'

    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to admin_posts_url, notice: 'The post was successfully destroyed.'
  end

  private
    def set_post
      @post = Post.friendly.find(params[:id])
    end

    # using in publish/unpublish and featured/unfeatured methods
    def set_post_id
      @post = Post.find(params[:post_id])
    end

    def post_params
      params.require(:post).permit(:category_id, :title, :description, :photo ,:person_id ,:publish_date ,:intro,:tags ,:side_image_caption ,:side_image,:published ,:link ,:slug ,:featured ,:side_image_link ,:quote_author ,:quote_text ,:twitter_text ,:news_source ,:pinned ,:image_link ,:image_author_name , :image_author_link , :cc_license, :pdf)
    end
end
