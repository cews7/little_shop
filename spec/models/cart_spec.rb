require "rails_helper"

describe Cart do
  it "exists" do
    expect(Cart).to be
  end

  context "#items" do
    it "returns an array of CartItems" do
      category = Category.create(title: "Animals")
      item = Item.create(title: "Miniature Pony", description: "This majestic little beauty will be the pet you always wanted and the life of any party. Who needs a cat?",
      price: 19999.99, image: "https://c1.staticflickr.com/7/6111/6869176460_795613ac05_b.jpg",
      category_id: category.id)
      data = Hash.new(0)
      data[item.id] = 2
      cart = Cart.new(data)

      expect(cart.items.first).to be_a_kind_of(CartItem)
    end
  end

  context "#data" do
    it "returns a hash with the item id and quantity" do
      category = Category.create(title: "Animals")
      item = Item.create(title: "Miniature Pony", description: "This majestic little beauty will be the pet you always wanted and the life of any party. Who needs a cat?",
      price: 19999.99, image: "https://c1.staticflickr.com/7/6111/6869176460_795613ac05_b.jpg",
      category_id: category.id)
      data = {}
      data[item.id.to_s] = 2
      cart = Cart.new(data)
      expect(cart.data).to eq({item.id.to_s => 2})
    end
  end

  context "#add_item" do
    it "updates the data method when an item is added" do
      category = Category.create(title: "Animals")
      item = Item.create(title: "Miniature Pony", description: "This majestic little beauty will be the pet you always wanted and the life of any party. Who needs a cat?",
      price: 19999.99, image: "https://c1.staticflickr.com/7/6111/6869176460_795613ac05_b.jpg",
      category_id: category.id)
      cart = Cart.new(nil)

      cart.add_item(item)
      expect(cart.data).to eq({item.id.to_s => 1})

      cart.add_item(item)
      expect(cart.data).to eq({item.id.to_s => 2})
    end
  end
end
