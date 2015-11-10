class CountriesController < ApplicationController
  before_action :set_country, only: [:show, :edit, :update]
  before_action :authenticate_user!
  layout 'backend'

  def index
    respond_to do |format|
      # Using it in the backEnd to allow the admin to show and navigate all the model data
      format.html {
        results=Country.search(params[:search],'name')
        @countries=results.page(params[:page])
        @count=results.count    
      }
      # Using it to export excel file 
      format.xls {
        @countries = Country.all
      }
    end
  end

  def new
    @country = Country.new
  end

  def create
    @country = Country.new(country_params)
    if @country.save
      redirect_to admin_countries_url, notice: 'The country was successfully created.'
    else
      render :new, notice: @country.errors
    end
  end

  def update
    if @country.update(country_params)
      redirect_to admin_countries_url, notice: 'The country was successfully updated.'
    else
      render :edit, notice: @country.errors
    end
  end

  private
    def set_country
      @country = Country.find(params[:id])
    end

    def country_params
      params.require(:country).permit(:name)
    end
end
