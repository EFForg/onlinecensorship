class IconsController < ApplicationController
  before_action :set_icon, only: %i(toggle_availability edit update destroy)
  before_action :authenticate_user!
  layout 'backend'

  def index
    @icons = Icon.all.page(params[:page]).order(created_at: :desc)
  end

  def new
    @icon = Icon.new
  end

  def create
    attrs = icon_params.transform_keys(&:to_sym)
    @icon = Icon.new(attrs.to_h)
    if @icon.save
      flash[:success] = 'Icon uploaded'
      redirect_to icons_path
    else
      flash[:error] = 'Icon failed to upload'
      render action: 'new'
    end
  end

  def edit; end

  def update
    if @icon.update(icon_params.transform_keys(&:to_sym).to_h)
      flash[:success] = 'Icon uploaded'
      redirect_to icons_path
    else
      flash[:error] = 'Icon failed to upload'
      render action: 'new'
    end
  end

  def toggle_availability
    @icon.update(available: !@icon.available)
    redirect_to icons_path
  end

  def destroy
    # TODO: validation requiring changing in use stories
  end

  private

  def set_icon
    @icon = Icon.find(params[:id])
  end

  def icon_params
    params.require(:icon).permit(%i(file available))
  end
end
