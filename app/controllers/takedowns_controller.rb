class TakedownsController < ApplicationController
  PUBLIC = %i(new create submitted).freeze
  before_action :set_takedown, only: %i(show destroy)
  before_action :authenticate_user! , except: PUBLIC
  layout 'backend', except: PUBLIC

  def index
    @takedowns = Takedown.search(params[:search], 'platform', 'name', 'email',
                                 'details', 'reason').page(params[:page]).order(created_at: :desc)
    @count = @takedowns.count
  end

  def show; end

  def new
    @takedown = Takedown.new
    5.times { @takedown.images.build }
  end

  def create
    @takedown = Takedown.new(takedown_params)
    if @takedown.save
      redirect_to submitted_takedowns_path
    else
      @appealed = @takedown.appealed
      5.times { @takedown.images.build }
      flash[:error] = 'Unable to submit takedown'
      render action: 'new'
    end
  end

  def destroy
    @takedown.destroy
    flash[:notice] = "Takedown deleted"
    redirect_to takedowns_path
  end

  def submitted; end

  private

  def takedown_params
    params.require(:takedown).permit(*%i(platform name email reason appealed
                                         details),
                                     images_attributes: %i(takedown_id file
                                                           content_type
                                                           original_filename))
  end

  def set_takedown
    @takedown = Takedown.find(params[:id])
  end
end
