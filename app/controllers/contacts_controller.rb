class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:new, :edit, :create]
  before_filter :filter_spam , only: [:create]
  layout 'backend', except: [:new]

  def index
    # Using it in the backEnd to allow the admin to show and navigate all the model data
    results=Contact.search(params[:search],'name','surname','email','pgp_key','message')
    @contacts=results.page(params[:page])
    @count=results.count
    @unreplied_count = results.where(replied: false).count    
  end

  def new
    respond_to do |format|
      # Using it in the frontEnd
      format.html {
        @contact = Contact.new
        @contacts_topics = ContactsTopic.all
      }
      # Using it to export excel file 
      format.xls {
        @contacts = Contact.all
      }
    end
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      # Call notify mailer method to notify the admin,
      # which will send the email template located in views/mailer/notify.html.erb
      # notify method need params [user name ,form,data,notification kind, email subject]
      data="<br> <b> Name: </b>"+@contact.name.to_s+"<br> <b> Surname: </b>"+@contact.surname.to_s+"<br> <b> Email: </b>"+@contact.email.to_s+"<br> <b> Pgp Key: </b>"+@contact.pgp_key.to_s+"<br> <b> Contacts Topic: </b>"+@contact.contacts_topic.name.to_s+"<br> <b> Message: </b>"+@contact.message.to_s
      Mailer.notify(@contact.name,"contact us",data,"contact_us","[OC notification System] Contact")
      ##
      render :nothing => true
    else
      render :nothing => true
    end
  end

  def destroy
    @contact.destroy
    redirect_to admin_contacts_url, notice: 'The message was successfully destroyed.'
  end

  def edit
  end

  def update
    @contact.replied = params[:contact][:replied]
    @contact.replied_by = params[:contact][:replied_by]
    @contact.save
    redirect_to admin_contacts_url, notice: 'Message was successfully updated.'
  end

  private

    # for filtering forms from spam
    def filter_spam
      if !params[:contact]["spam_checker"].blank?
        redirect_to root_path
        return false
      end
    end

    def set_contact
      @contact = Contact.find(params[:id])
    end

    def contact_params
      params.require(:contact).permit(:name, :surname, :email, :pgp_key, :contacts_topic_id, :message)
    end
end
