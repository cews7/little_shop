class ItemsController < ApplicationController
  def index
    if request.original_fullpath == '/items'
      @items = Item.all
    else
      @category = Category.find(params[:category_id])
      @items = @category.find_items_associated_with_category
    end
  end
end
