class HomeController < ApplicationController
  def index
    @items = Item.limit(3).order("RANDOM()")
    @cart_items = cart.items
  end
end
