class SubscribesController < ApplicationController
  before_action :set_subscribe, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:index , :destroy]
  before_filter :filter_spam , only: [:create]
  layout 'backend'

  def index
    respond_to do |format|
      # Using it in the backEnd to allow the admin to show and navigate all the model data
      format.html {
        results=Subscribe.search(params[:search],'email')
        @subscribes=results.page(params[:page])
        @count=results.count
      }
      # Using it to export excel file
      format.xls {
        @subscribes = Subscribe.all
      }
    end

  end

  def create
    @subscribe = Subscribe.new(subscribe_params)
    if @subscribe.save
      # Call notify mailer method to notify the admin,
      # which will send the email template located in views/mailer/notify.html.erb
      # notify method need params [user name ,form,data,notification kind, email subject]
      data="<br> <b> Email: </b>"+@subscribe.email.to_s
      Mailer.notify("","subscriber",data,"subscriber","[OC notification System] Subscription")
      ##
      render :nothing => true
    else
      render :nothing => true
    end
  end

  def destroy
    @subscribe.destroy
   redirect_to admin_subscribes_url, notice: 'The subscribe was successfully destroyed.'
  end

  private

    # for filtering forms from spam
    def filter_spam
      if !params[:subscribe]["spam_checker"].blank?
        redirect_to root_path
        return false
      end
    end

    def set_subscribe
      @subscribe = Subscribe.find(params[:id])
    end

    def subscribe_params
      params.require(:subscribe).permit(:email)
    end
end
