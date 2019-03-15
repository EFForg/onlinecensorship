class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :subscribe
  before_action :set_locale

	# Include the helper method 
  include ApplicationHelper

  # redirect user after sign in
  def after_sign_in_path_for(resource)
    admin_dashboard_path
  end

  # Define the subscribe model to all the pages
  def subscribe
    @subscribe = Subscribe.new
  end

  def default_url_options(options={})
    { :locale => I18n.locale == I18n.default_locale ? nil : I18n.locale  }
  end
  
  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  private

  def backend_index(model_class, translation: true)
    respond_to do |format|
      format.html {
        if translation
          model_class = model_class.unscoped.with_translations(I18n.locale)
        end
        @query = model_class.ransack(params[:q])
        @collection = @query.result(distinct: true)
        @count = @collection.count
        @collection = @collection.page(params[:page])
      }
      format.xls {
        @collection = model_class.all
      }
      if model_class.respond_to? :to_csv
        format.csv {
          send_data model_class.to_csv,
            filename: model_class.name.downcase.pluralize + "_" +
              Date.current().to_s(:iso8601)
        }
      end
    end
  end
end
