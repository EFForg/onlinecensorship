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
    @icon = Icon.new(icon_params)
    if @icon.save
      redirect_to icons_path, notice: 'Icon uploaded'
    else
      flash[:error] = 'Icon failed to upload'
      render action: 'new'
    end
  end

  def edit; end

  def update
    if @icon.update(icon_params)
      redirect_to icons_path, notice: 'Icon uploaded'
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
    msg = if @icon.destroy
            { notice: "Icon deleted." }
          else
            { flash: { error: "Icon could not be deleted because it is still "\
                       "used in a story." } }
          end
    redirect_to icons_path, **msg
  end

  private

  def set_icon
    @icon = Icon.find(params[:id])
  end

  def icon_params
    params.require(:icon).permit(%i(file available))
  end
end
