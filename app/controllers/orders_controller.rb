class OrdersController < ApplicationController

  def show
    @cart_items = cart.items
    @order = Order.find(params[:id])
    @items = []
    @order.order_items.each do |item|
    @items <<  Item.find(item.item_id)
    end
  end

  def index
    @cart_items = cart.items
    @items = session[:cart] || {}
    @user = User.find(session[:user_id])
    @orders = @user.orders
  end

  def create
    @order = Order.new
    @order.save
    session[:cart].each do |item_id, quantity|
      @order.order_items.create(item_id: item_id, quantity: quantity)
    end
    if @order.save
      @order.user_id = session[:user_id]
      @order.status = "ordered"
      @order.save
      session.delete(:cart)
      redirect_to order_path(@order.id)
    else
      redirect_to cart_items_path
    end
  end

end
