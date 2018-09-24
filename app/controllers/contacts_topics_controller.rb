class ContactsTopicsController < ApplicationController
  before_action :set_contacts_topic, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  layout 'backend'

  def index
    backend_index(ContactsTopic)
  end

  def new
    @contacts_topic = ContactsTopic.new
  end

  def create
    @contacts_topic = ContactsTopic.new(contacts_topic_params)
    if @contacts_topic.save
      redirect_to admin_contacts_topics_url, notice: 'The topic was successfully created.'
    else
      render :new, notice: @contacts_topic.errors
    end
  end

  def update
    if @contacts_topic.update(contacts_topic_params)
      redirect_to admin_contacts_topics_url, notice: 'The topic was successfully updated.'
    else
      render :edit, notice: @contacts_topic.errors
    end
  end

  def destroy
    @contacts_topic.destroy
    redirect_to admin_contacts_topics_url, notice: 'The topic was successfully destroyed.'
  end

  private
    def set_contacts_topic
      @contacts_topic = ContactsTopic.find(params[:id])
    end

    def contacts_topic_params
      params.require(:contacts_topic).permit(:name)
    end
end
