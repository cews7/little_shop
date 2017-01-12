module ApplicationHelper
  def cart_total(cart_items)
    cart_prices = cart_items.map do |item|
      item.price * item.quantity
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
    if cart_items == nil
      0
    else
      cart_items.map do |item|
        item.quantity
      end.reduce(:+)
    end
  end

  def order_total(order_items)
    order_items.map do |item|
      item.first.price * item.count
    end.reduce(:+)
  end
end
