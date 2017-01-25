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

  def number_of_ordered(orders)
    orders.where(status: "Ordered").count
  end

  def number_of_paid(orders)
    orders.where(status: "Paid").count
  end

  def number_of_completed(orders)
    orders.where(status: "Completed").count
  end

  def number_of_canceled(orders)
    orders.where(status: "Canceled").count
  end

  def total_for_order(order_items)
    order_items.map do |item|
      item.price * item.quantity
    end.reduce(:+)

  end
end
