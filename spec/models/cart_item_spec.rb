require "rails_helper"

describe CartItem do
  let(:category) {Category.create!(title: "Animals")}
  it "returns the title of the item" do
    item = Item.create(title: "Miniature Pony", description: "This majestic little beauty will be the pet you always wanted and the life of any party. Who needs a cat?",
    price: 19999.99, image: "https://c1.staticflickr.com/7/6111/6869176460_795613ac05_b.jpg",
    category_id: category.id)
    cart_item = CartItem.new(item)

    expect(cart_item.title). to eq("Miniature Pony")
  end

  it "returns the quantity for an item" do
    item = Item.create(title: "Miniature Pony", description: "This majestic little beauty will be the pet you always wanted and the life of any party. Who needs a cat?",
    price: 19999.99, image: "https://c1.staticflickr.com/7/6111/6869176460_795613ac05_b.jpg",
    category_id: category.id)
    cart_item = CartItem.new(item, 2)

    expect(cart_item.quantity).to eq(2)
  end

  it "returns the description for an item" do
    item = Item.create(title: "Miniature Pony", description: "This majestic little beauty will be the pet you always wanted and the life of any party. Who needs a cat?",
    price: 19999.99, image: "https://c1.staticflickr.com/7/6111/6869176460_795613ac05_b.jpg",
    category_id: category.id)
    cart_item = CartItem.new(item, 2)

    expect(cart_item.description).to eq("This majestic little beauty will be the pet you always wanted and the life of any party. Who needs a cat?")
  end

  it "returns the price for an item" do
    item = Item.create(title: "Miniature Pony", description: "This majestic little beauty will be the pet you always wanted and the life of any party. Who needs a cat?",
    price: 19999.99, image: "https://c1.staticflickr.com/7/6111/6869176460_795613ac05_b.jpg",
    category_id: category.id)
    cart_item = CartItem.new(item, 2)

    expect(cart_item.price).to eq(19999.99)
  end

  it "returns the category id for an item" do
    item = Item.create(title: "Miniature Pony", description: "This majestic little beauty will be the pet you always wanted and the life of any party. Who needs a cat?",
    price: 19999.99, image: "https://c1.staticflickr.com/7/6111/6869176460_795613ac05_b.jpg",
    category_id: category.id)
    cart_item = CartItem.new(item, 2)

    expect(cart_item.category_id).to eq(category.id)
  end
end
