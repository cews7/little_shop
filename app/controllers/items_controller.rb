class ItemsController < ApplicationController
  def index
    @cart_items = cart.items
    @items = Item.all
  end

  def show
    @cart_items = cart.items
    @item = Item.find(params[:id])
  end
end
