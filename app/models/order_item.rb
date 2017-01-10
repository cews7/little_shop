class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :item

  def create(item_id, quantity)
    order_item = OrderItem.new
    order_item.item = Item.find(item_id)
    order_item.quantity = quantity
    order_item.save
  end
end
