class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :current_admin, :require_admin, :current_cart

  def cart
    @cart ||= Cart.new(session[:cart])
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_admin
    current_user && current_user.role == "admin"
  end

  def require_admin
    redirect_to root_path, status: 401 unless current_admin
  end

  def current_cart
    if @cart_items != nil
      @current_cart = @cart_items
    end
  end

  def order
    Order.new(session[:cart])
  end
end
