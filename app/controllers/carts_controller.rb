class CartsController < ApplicationController

  def create
    @item = Item.find(params[:item_id])
  end

  def index
    @items = session[:cart] || {}
  end

end
