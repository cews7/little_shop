class CartController < ApplicationController
  def create
    item = Item.find(params[:item_id])
    @cart.add_item(item)
    session[:cart] = @cart.contents
    redirect_to carts_path
  end

  def index
    @cart_items = cart.items
    @items = session[:cart] || {}
  end
end
