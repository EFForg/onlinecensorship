class StoriesController < ApplicationController
  before_action :set_story, only: [:show, :edit, :update, :destroy]
  before_action :set_story_id, only: [:publish]
  before_action :authenticate_user! , except: [:show]
  layout 'backend', except: [:show]

  def index
    backend_index(Story)
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
    @icons = Icon.where(available: true)
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

  def edit
    @icons = Icon.where(available: true)
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
    params.require(:story).permit(:title, :brief, :content, :external_link,
                                  :published, :icon_id,
                                  icon_attributes: %i(file content_type))
  end
end
