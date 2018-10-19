class FaqsController < ApplicationController
  before_action :set_faq, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user! , except: [:index]
  layout 'backend', except: [:index]


  def admin
    # this is the admin backend index
    @collection, @count, @query = backend_index(Faq)
  end

  def index
    @faqs = Faq.all
  end

  def new
    @faq = Faq.new
  end

  def create
    @faq = Faq.new(faq_params)
    if @faq.save
      redirect_to admin_faqs_url, notice: 'The faq was successfully created.'
    else
      render :new, notice: @faq.errors
    end
  end

  def update
    if @faq.update(faq_params)
      redirect_to admin_faqs_url, notice: 'The faq was successfully updated.'
    else
      render :edit, notice: @faq.errors
    end
  end

  def destroy
    @faq.destroy
    redirect_to admin_faqs_url, notice: 'The faq was successfully destroyed.'
  end

  private
    def set_faq
      @faq = Faq.find(params[:id])
    end

    def faq_params
      params.require(:faq).permit(:question, :answer, :theorder)
    end
end
