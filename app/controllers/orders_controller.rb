class OrdersController < ApplicationController

  def index
    @cart_items = cart.items
    @items = session[:cart] || {}
  end

end
