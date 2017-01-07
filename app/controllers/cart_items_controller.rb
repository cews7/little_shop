class CartItemsController < ApplicationController

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
    # byebug

    item = Item.find(params[:cart_item_id])
    cart.delete_item(item)
    # @cart_items = cart.items
    # @cart_items.map do |cart_item|
    #   if cart_item.title == item.title
    #     cart_item.delete
    #   end
    # end
    # flash[:notice] = <%= %Q[link_To Deleted #{item.title}] %>
    redirect_to cart_path
  end


end
