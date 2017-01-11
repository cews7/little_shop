class Admin::OrdersController < ApplicationController

  def show
    @cart_items = cart.items
    @order = Order.find(params[:id])
    items = []
    @order.order_items.each do |item|
      item.quantity.times {items << Item.find(item.item_id)}
    end
    @items = items.group_by(&:itself)
  end

  def index
    @cart_items = cart.items
    @orders = Order.all
  end




end
