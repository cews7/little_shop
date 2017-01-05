class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def cart
    Cart.new(session[:cart])
  end
  # before_action :load_cart
  #
  # def load_cart
  #   @cart ||= Cart.new(session[:cart])
  # end
end
