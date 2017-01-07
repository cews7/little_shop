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

  xcontext "#delete_item" do
    it "deletes from the data method when an item is added" do
      category = Category.create(title: "Animals")
      item_1 = Item.create(title: "Miniature Pony", description: "This majestic little beauty will be the pet you always wanted and the life of any party. Who needs a cat?",
      price: 19999.99, image: "https://c1.staticflickr.com/7/6111/6869176460_795613ac05_b.jpg",
      category_id: category.id, retired: false)
      item_2 = Item.create(title: "Tiny Dog", description: "Ever wanted a guard dog that you could take with you? Ever got tired of having to recharge the batteries in your tazer? Get this little fella that can fit in your purse and never feel unsafe again.",
      price: 299.99, image: "http://www.dogbreedplus.com/dog_breeds/images/White-and-Grey-Pomsky.jpg",
      category_id: category.id, retired: false)
      cart = Cart.new(nil)

      cart.add_item(item_1)
      cart.add_item(item_2)

      cart.delete_item(item_2)

      expect(cart.data).should_not have_key(item_2.id.to_s)

    end
  end

  context "#update" do
    it "cart data has the new data when you update the quantity of an item" do
      category = Category.create(title: "Animals")
      item = Item.create(title: "Miniature Pony", description: "This majestic little beauty will be the pet you always wanted and the life of any party. Who needs a cat?",
      price: 19999.99, image: "https://c1.staticflickr.com/7/6111/6869176460_795613ac05_b.jpg",
      category_id: category.id)
      cart = Cart.new(nil)

      cart.add_item(item)

      cart.update(item, "5")

      expect(cart.data).to have_value(5)
    end
  end

  end
