class FurtherReadsController < ApplicationController
  before_action :set_further_read, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user! , except: [:index]
  layout 'backend', except: [:index]

  def admin
    ######################################################################
    # Admin method
    # we using it in the backEnd to allow the admin to show and navigate all the model data
    ######################################################################
    results=FurtherRead.search(params[:search],'title','author' ,'category' ,'link' ,'written_in' ,'year')
    @further_reads=results.page(params[:page])
    @count=results.count
  end

  def index
    @further_reads = FurtherRead.order(:the_order => :asc)
    @staff=@further_reads.where(:category=>"STAFF")
    @books=@further_reads.where(:category=>"Books")
    @blog=@further_reads.where(:category=>"Blog")
  end

  def new
    @further_read = FurtherRead.new
  end

  def create
    @further_read = FurtherRead.new(further_read_params)
    if @further_read.save
      redirect_to admin_further_reads_url, notice: 'The post was successfully created.'
    else
      render :new, notice: @further_read.errors
    end
  end

  def update
    if @further_read.update(further_read_params)
      redirect_to admin_further_reads_url, notice: 'The post was successfully updated.'
    else
      render :edit, notice: @further_read.errors
    end
  end

  def destroy
    @further_read.destroy
    redirect_to admin_further_reads_url, notice: 'The post was successfully destroyed.'
  end

  private
    def set_further_read
      @further_read = FurtherRead.find(params[:id])
    end

    def further_read_params
      params.require(:further_read).permit(:title, :category, :author ,:link ,:written_in ,:year,:the_order)
    end
end
