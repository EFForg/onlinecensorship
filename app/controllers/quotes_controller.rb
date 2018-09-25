class QuotesController < ApplicationController
  before_action :set_quote, only: [:show, :edit, :update, :destroy]
  before_action :set_quote_id, only: [:featured]
  before_action :authenticate_user!
  layout 'backend'

  def index
    backend_index(Quote)
  end

  def featured
    # featured the quote "Allow the admin to fix/unfix the quote from the backEnd"
    ReverseField(@quote,"featured")
    redirect_to admin_quotes_url , notice: 'The quote was successfully featured.'
  end

  def new
    @quote = Quote.new
    @platfroms = SocialMediaPlatform.all
    @themes = PostsTheme.all
  end

  def edit
    @platfroms = SocialMediaPlatform.all
    @themes = PostsTheme.all
  end

  def create
    @quote = Quote.new(quote_params)
    if @quote.save

      # add the quote themes
      if params[:theme]
        params[:theme].each do |element|
          theme = PostsTheme.find(element)
          @quote.posts_themes << theme unless @quote.posts_themes.include?(theme)
        end
      else
        # to handle the empty array error
        @quote.posts_themes = []
      end

      # add the quote platforms
      if params[:platfrom]
        params[:platfrom].each do |element|
          platform = SocialMediaPlatform.find(element)
          @quote.social_media_platforms << platform unless @quote.social_media_platforms.include?(platform)
        end
      else
        # to handle the empty array error
        @quote.social_media_platforms = []
      end

      redirect_to admin_quotes_url, notice: 'The quote was successfully created.'
    else
      render :new , notice: @quote.errors
    end
  end

  def update
    if @quote.update(quote_params)

      # update the quote themes
      if params[:theme]
        # delete the old data
        @quote.posts_themes.delete_all
        # add the new themes
        params[:theme].each do |element|
          theme = PostsTheme.find(element)
          @quote.posts_themes << theme unless @quote.posts_themes.include?(theme)
        end
      end

      # update the quote platforms
      if params[:platfrom]
        # delete the old data
        @quote.social_media_platforms.delete_all
        # add the new themes
        params[:platfrom].each do |element|
          platform = SocialMediaPlatform.find(element)
          @quote.social_media_platforms << platform unless @quote.social_media_platforms.include?(platform)
        end
      end

      redirect_to admin_quotes_url, notice: 'The quote was successfully updated.'
    else
      render :edit , notice: @quote.errors
    end
  end

  def destroy
    @quote.destroy
    redirect_to admin_quotes_url, notice: 'The quote was successfully destroyed.'
  end

  private
    def set_quote
      @quote = Quote.find(params[:id])
    end

    # using in featured / unfeatured methods
    def set_quote_id
      @quote = Quote.find(params[:quote_id])
    end

    def quote_params
      params.require(:quote).permit(:author, :font_size, :quote ,:twitter_text ,:featured)
    end
end
