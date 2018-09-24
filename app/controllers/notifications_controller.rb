class NotificationsController < ApplicationController
  before_action :set_notification, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  layout 'backend'

  def index
    backend_index(Notification, translation: false)
  end

  def new
    @notification = Notification.new
  end

  def create
    @notification = Notification.new(notification_params)
    if @notification.save
      redirect_to admin_notifications_url, notice: 'The notification was successfully created.'
    else
      render :nothing => true  , notice: @notification.errors
    end
  end

  def update
    if @notification.update(notification_params)
      redirect_to admin_notifications_url, notice: 'The notification was successfully updated.'
    else
      render :edit, notice: @notification.errors
    end
  end

  def destroy
    @notification.destroy
    redirect_to admin_notifications_url, notice: 'The notification was successfully destroyed.'
  end

  private
    def set_notification
      @notification = Notification.find(params[:id])
    end

    def notification_params
      params.require(:notification).permit(:name, :email, :submit_report, :contact_us, :subscriber)
    end
end
