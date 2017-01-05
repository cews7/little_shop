module ApplicationHelper
  def cart_total(cart_items)
    cart_prices = []
    cart_items.map do |item|
      cart_prices << item.price * item.quantity
    end

    if cart_prices.reduce(:+).nil?
      cart_prices = 0.00
    else
      cart_prices.reduce(:+).round(2)
    end
  end
end
