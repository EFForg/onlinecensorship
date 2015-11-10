class HomeFieldsController < ApplicationController
  before_action :set_home_field, only: [:edit, :update]
  before_action :authenticate_user!
  layout 'backend'

  def update
    if @home_field.update(home_field_params)
      redirect_to edit_home_field_path(@home_field.id), notice: 'The fields was successfully updated.'
    else
      render :edit, notice: @home_field.errors
    end
  end

  private
    def set_home_field
      @home_field = HomeField.find(params[:id])
    end

    def home_field_params
      params.require(:home_field).permit(:slogan, :what_oc_title, :what_oc_text, :appeal_text, :appeal_btn_text ,:submit_btn_text)
    end
end
