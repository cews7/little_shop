class OrderItemsController < ApplicationController

  def create
    @order = Order.new
    session[:cart].each do |item_id, quantity|
      @order.order_items.create(item_id: item_id, quantity: quantity)
    end
    if @order.save
      session.delete(:cart)
      redirect_to orders_path(order)
    else
      redirect_to cart_items_path
    end
  end

end
