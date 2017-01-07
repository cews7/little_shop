class CategoriesController < ApplicationController
  def index
    @cart_items = cart.items
    @categories = Category.all
  end


end
