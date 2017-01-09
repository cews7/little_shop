class OrdersController < ApplicationController

  def show
    @cart_items = cart.items
    @order = Order.find(params[:id])
  end

  def index
    @cart_items = cart.items
    @items = session[:cart] || {}
    @user = User.find(session[:user_id])
    @orders = @user.orders
  end

  def create
    @order = Order.new
    @user = User.find(session[:user_id])
    @order = @user.orders.new
    @order.cart = (session[:cart])
    @order.status = "ordered"

    if @order.save
      session.delete(:cart)
      redirect_to orders_path(order)
    else
      redirect_to cart_items_path
    end
  end



end
