# Search method
#
# It's global method that we can used it in any model to search in it by using any numbers of fields
# to use it
# 1- you need to extend it in your model by add  "extend Search"
# 2- just add to your query  .search(params[:search],'first field name ','field name', ......... )
#
module Search

  def search(search_value,*args)
    if search_value

      # Empty old queries
      @query=nil
      @args_count=nil

      # Get fields number
      @args_count=args.count.to_i-1

      args.each_with_index do |arg_item , index|
        # Create mysql search statement
        @query=@query.to_s+arg_item.to_s+" LIKE '%"+search_value.to_s+"%'"
        if index < @args_count
          @query=@query.to_s+" || "
        end
      end

    else
      @query=" id<>'' "
    end

    self.where(@query)

  end

end