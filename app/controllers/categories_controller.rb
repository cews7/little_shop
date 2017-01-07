class CategoriesController < ApplicationController
  def index
    @q = Category.ransack(params[:q])
    @category = @q.result(distinct: true)

    @cart_items = cart.items
    @categories = Category.all
  end

  
end
