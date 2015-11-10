class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  layout 'backend'

  def index
    respond_to do |format|
      # Using it in the backEnd to allow the admin to show and navigate all the model data
      format.html {
        results=Category.search(params[:search],'title')
        @categories=results.page(params[:page])
        @count=results.count      
      }
      # Using it to export excel file 
      format.xls {
        @categories=Category.all
      }
    end
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to admin_categories_url, notice: 'The category was successfully created.'
    else
      render :new , notice: @category.errors
    end
  end

  def update
    if @category.update(category_params)
      redirect_to admin_categories_url, notice: 'The category was successfully updated.'
    else
      render :edit, notice: @category.errors
    end
  end

  def destroy
    # Unpublish all the related posts
    Post.where(:category_id=>@category.id).update_all(:published => false)
    # Delete the category
    @category.destroy
    redirect_to admin_categories_url, notice: 'The category was successfully destroyed.'
  end

  private
    def set_category
      @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:title, :color)
    end
end