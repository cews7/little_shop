class HomeController < ApplicationController
  def index
    @cart_items = cart.items
  end
end
