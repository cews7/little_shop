class CategoriesController < ApplicationController
  def index
    @cart_items = cart.items
    @categories = Category.all
  end

  def show
    @cart_items = cart.items
    @category = Category.friendly.find(params[:id])
    @items = @category.items
  end
end
