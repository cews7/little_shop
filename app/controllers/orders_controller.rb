class OrdersController < ApplicationController

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
    @items = session[:cart] || {}
    @user = User.find(session[:user_id])
    @orders = @user.orders
  end

  def create
    @order = Order.new
    @order.save
    contents_determination
    cart_saving
  end

private

  def contents_determination
    if session[:cart].nil?
      flash[:danger] = "You currently don't have any orders, have you shopped with us before?"
    else
      session[:cart].each do |item_id, quantity|
        @order.order_items.create(item_id: item_id, quantity: quantity)
      end
    end
  end

  def cart_saving
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
