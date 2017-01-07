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

  def subtotal(price, quantity)
    (price * quantity).round(2)
  end

  def count(cart_items)
    count = []
    cart_items.each do |item|
      count << item.quantity
    end
    count.reduce(:+)
  end
end
