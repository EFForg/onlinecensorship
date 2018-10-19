class PeopleController < ApplicationController
  before_action :set_person, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!  
  layout 'backend'

  def index
    @collection, @count, @query = backend_index(Person)
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
