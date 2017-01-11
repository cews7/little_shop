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
    byebug
    @cart_items = cart.items
    @orders = Order.all
    byebug
  end

  def update
    @order = Order.find(params[:id])
    order_status
    redirect_to admin_order_path(@order.id)
  end

private

  def order_status
    if params[:commit]    == "Mark as Paid"
      @order.status        = "Paid"
    elsif params[:commit] == "Cancel"
      @order.status        = "Canceled"
    else params[:commit]  == "Completed"
      @order.status        = "Completed"
    end
    @order.save
  end

end
