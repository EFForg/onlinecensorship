class StoriesController < ApplicationController
  before_action :set_story, only: [:show, :edit, :update, :destroy]
  before_action :set_story_id, only: [:publish]
  before_action :authenticate_user! , except: [:show]
  layout 'backend', except: [:show]

  def index
    respond_to do |format|
      # Using it in the backEnd to allow the admin to show and navigate all the model data
      format.html {
        results=Story.search(params[:search],'title','brief','content')
        @stories=results.page(params[:page])
        @count=results.count
      }
      # Using it to export excel file
      format.xls {
        @stories = Story.all
      }
    end
  end

  def publish
    # publish the story "Allow the admin to publish/unpublish the story from the backEnd"
    ReverseField(@story,"published")
    redirect_to admin_stories_url , notice: 'The story was successfully published.'
  end

  def show
    @stories = Story.where("id != ?", @story.id).order("RAND()").limit(3)
  end

  def new
    @story = Story.new
  end

  def create
    @story = Story.new(story_params)
    if @story.save
      redirect_to admin_stories_url, notice: 'The story was successfully created.'
    else
      render :new , notice: @story.errors
    end
  end

  def update
    if @story.update(story_params)
      redirect_to admin_stories_url, notice: 'The story was successfully updated.'
    else
      render :edit , notice: @story.errors
    end
  end

  def destroy
    @story.destroy
    redirect_to admin_stories_url, notice: 'The story was successfully destroyed.'
  end

  private
    def set_story
      @story = Story.find(params[:id])
    end

    # using in publish / unpublish methods
    def set_story_id
      @story = Story.find(params[:story_id])
    end

    def story_params
      params.require(:story).permit(:photo, :title, :brief, :content, :external_link, :published)
    end
end
