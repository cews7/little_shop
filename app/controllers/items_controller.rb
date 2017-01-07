class ItemsController < ApplicationController
  def index
    @cart_items = cart.items
    if request.original_fullpath == '/items'
      @items = Item.all
    else
      @category = Category.find(params[:category_id])
      @items = @category.items
    end
  end
end
