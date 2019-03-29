class LanguagesController < ApplicationController
  before_action :set_language, only: [:show, :edit, :update]
  before_action :authenticate_user!
  layout 'backend'

  def index
    @collection, @count, @query = backend_index(Language)
  end

  def new
    @language = Language.new
  end

  def create
    @language = Language.new(language_params)
    if @language.save
      redirect_to admin_languages_url, notice: 'The language was successfully created.'
    else
      render :new , notice: @language.errors
    end
  end

  def update
    if @language.update(language_params)
      redirect_to admin_languages_url, notice: 'The language was successfully updated.'
    else
      render :edit, notice: @language.errors
    end
  end

  private
    def set_language
      @language = Language.find(params[:id])
    end

    def language_params
      params.require(:language).permit(:name)
    end
end
