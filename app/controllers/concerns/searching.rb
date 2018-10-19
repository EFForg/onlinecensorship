module Searching
  private

  def backend_index(model_class, translation: true)
    case request.format.to_sym
    when :html
      if translation
        model_class = model_class.unscoped.with_translations(I18n.locale)
      end
      query = model_class.ransack(params[:q])
      collection = query.result(distinct: true)
      count = collection.count
      collection = collection.page(params[:page])
      return [collection, count, query]
    when :xls
      return [model_class.all]
    end
    if model_class.respond_to? :to_csv
      format.csv {
        send_data model_class.to_csv,
        filename: model_class.name.downcase.pluralize + "_" +
        Date.current().to_s(:iso8601)
      }
    end
  end
end
