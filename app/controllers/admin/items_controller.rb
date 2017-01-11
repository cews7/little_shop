class Admin::ItemsController < ApplicationController

  def index
    @items = Item.all
    @cart_items = cart.items
  end

end
