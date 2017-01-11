class CartItemsController < ApplicationController
  include ActionView::Helpers::TextHelper
  def create
    item = Item.find(params[:item_id])
    cart.add_item(item)
    session[:cart] = cart.data
    redirect_to items_path
  end

  def index
    @cart_items = cart.items
  end

  def update
    item = Item.find(params[:cart_item])
    item_quantity = params[:cart_item_quantity]
    cart.update(item, item_quantity)
    redirect_to cart_path
  end

  def destroy
    item = Item.find(params[:cart_item_id])
    cart.delete_item(item)
    redirect_to cart_path
    flash[:notice] = "#{view_context.link_to(item.title, item_path(item.id))}, successfully removed from cart!"
  end
end
