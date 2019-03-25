module BackendIndex
  private

  def backend_index(model_class, translation: true)
    case request.format.to_sym
    when :html
      model_class = model_class.unscoped
      query = model_class.ransack(search_params[:q])
      collection = query.result(distinct: true)
      count = collection.count
      collection = collection.page(search_params[:page])
      return [collection, count, query]
    when :xls
      return [model_class.all]
    when :csv
      if model_class.respond_to? :to_csv
        send_data(model_class.to_csv,
                  filename: model_class.name.downcase.pluralize + "_" +
                            Date.current().to_s(:iso8601))
      end

    end
  end

  def search_params
    params.permit(:page, q: [:searchable_cont])
  end
end
