class ItemsController < ApplicationController
  def index
    if request.original_fullpath == '/items'
      @items = Item.all
    else
      @category = Category.find(params[:category_id])
      @items = @category.items
    end
  end
end
