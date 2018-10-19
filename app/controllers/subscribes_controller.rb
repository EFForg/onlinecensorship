class SubscribesController < ApplicationController
  before_action :set_subscribe, only: [:show, :edit, :update, :destroy]
  before_action :set_confirmation, only: [:subscribe_confirmation]
  before_action :authenticate_user!, only: [:index , :destroy]
  before_action :filter_spam , only: [:create]
  layout 'backend'

  def index
    @collection, @count, @query = backend_index(Subscribe, translation: false)
  end

  def create
    @subscribe = Subscribe.new(subscribe_params)
    if @subscribe.save
      # Create the confirmation token
      token=SecureRandom.base64(15).tr('+/=', '0aZ').strip.delete("\n")+@subscribe.id.to_s
      @subscribe.update_attributes(:confirmation_token => token)
      # Send confirmation email
      # subscribe_confirmation method need params [token,to email,domain url]
      Mailer.subscribe_confirmation(token,@subscribe.email,root_url).deliver
      ##
      # Call notify mailer method to notify the admin,
      # which will send the email template located in views/mailer/notify.html.erb
      # notify method need params [user name ,form,data,notification kind, email subject]
      data="<br> <b> Email: </b>"+@subscribe.email.to_s
      Mailer.notify("","subscriber",data,"subscriber","[OC notification System] Subscription")
      ##
    end
    render json: {}
  end

  # subscribe confirmation method using to confirm the user email
  def subscribe_confirmation
    if @confirmation
      @confirmation.confirmed = true
      @confirmation.save
      redirect_to root_path(), notice: 'The email was successfully confirmed.'
    else
      redirect_to root_path(), alert: 'The email not confirmed.'      
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

    def set_confirmation
      @confirmation = Subscribe.find_by(confirmation_token: params[:token])
    end

    def subscribe_params
      params.require(:subscribe).permit(:email,:confirmation_token,:confirmed)
    end
end
