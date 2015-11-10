class PeopleController < ApplicationController
  before_action :set_person, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!  
  layout 'backend'

  def index
    respond_to do |format|
      # Using it in the backEnd to allow the admin to show and navigate all the model data
      format.html {
        results=Person.search(params[:search],'name','bio')
        @people=results.page(params[:page])
        @count=results.count 
      }
      # Using it to export excel file
      format.xls {
        @people = Person.all
      }
    end
  end

  def new
    @person= Person.new
  end

  def create
    @person = Person.new(person_params)
    if @person.save
      redirect_to admin_people_url, notice: 'The person was successfully created.'
    else
      render :new, notice: @person.errors
    end
  end

  def update
    if @person.update(person_params)
      redirect_to admin_people_url, notice: 'The person was successfully updated.'
    else
      render :edit, notice: @person.errors
    end
  end

  def destroy
    @people.destroy
    redirect_to admin_people_url, notice: 'The person was successfully destroyed.'
  end

  private
    def set_person
      @person = Person.friendly.find(params[:id])
    end

    def person_params
      params.require(:person).permit(:name, :bio, :advisor, :team, :author, :photo ,:role,:theorder)
    end
end
