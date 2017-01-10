class Cart
  attr_reader :data

  def initialize(initial_contents)
    @data = initial_contents || Hash.new
  end

  def items
    @data.map do |item_id, quantity|
      item = Item.find(item_id)
      CartItem.new(item, quantity)
    end
  end

  def add_item(item)
    data[item.id.to_s] ||= 0
    data[item.id.to_s] +=  1
  end

  def delete_item(item)
    data.delete(item.id.to_s)
  end

  def update(item, item_quantity)
    new_data = {item.id.to_s => item_quantity.to_i}
    data.merge!(new_data)
  end
end
