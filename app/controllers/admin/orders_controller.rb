class Admin::OrdersController < ApplicationController
  before_action :require_admin

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
    type_of_order
    @cart_items = cart.items
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

  def type_of_order
    if params[:commit]    == "View Paid"
      @orders = Order.where(status: "Paid")
    elsif params[:commit] == "View Canceled"
      @orders = Order.where(status: "Canceled")
    elsif params[:commit]  == "View Completed"
      @orders = Order.where(status: "Completed")
    else params[:commit] == "View Ordered"
      @orders = Order.where(status: "Ordered")
    end
  end

end
