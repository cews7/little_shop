require "rails_helper"

describe Order do
  before(:each) do
    
    category = Category.create(title: "Animals")
    @item = Item.create(title: "Miniature Pony", description: "This majestic little beauty will be the pet you always wanted and the life of any party. Who needs a cat?",
    price: 19999.99, image: "https://c1.staticflickr.com/7/6111/6869176460_795613ac05_b.jpg",
    category_id: category.id)
    data = Hash.new(0)
    data[@item.id] = 2
    cart = Cart.new(data)
    @order = Order.create
    @order_1 = data.map do |item_id, quantity|
      @order.order_items.create(item_id: item_id, quantity: quantity)
    end
  end

  context "#order_items" do
    it "returns an array of OrderItems" do


      expect(@order_1.first).to be_a_kind_of(OrderItem)
    end
  end

  context "#data" do
    it "contains the item id" do

      expect(@order_1.first.item_id).to eq(@item.id)
    end

    it "contains the item quantity" do

      expect(@order_1.first.quantity).to eq(2)
    end
  end

  context "#relationships" do
    it "has many order items" do
      expect(@order).to respond_to(:order_items)
    end

    it "has many order items" do
      expect(@order).to respond_to(:items)
    end
  end
end
