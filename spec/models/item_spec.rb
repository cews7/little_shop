require 'rails_helper'

describe Item do
  describe "validations" do
    let(:category) {Category.create!(title: "Animals")}
    context "invalid attributes" do
      it "is invalid without title" do
        item = Item.create(description: "This majestic little beauty will be the pet you always wanted and the life of any party. Who needs a cat?",
        price: 19999.99, image: "https://c1.staticflickr.com/7/6111/6869176460_795613ac05_b.jpg",
        category_id: category.id)

        expect(item).to be_invalid
      end

      it "is invalid without description" do
        item = Item.create(title: "miniture pony",
        price: 19999.99, image: "https://c1.staticflickr.com/7/6111/6869176460_795613ac05_b.jpg",
        category_id: category.id)

        expect(item).to be_invalid
      end

      it "is invalid without price" do
        item = Item.create(title: "miniture pony", description: "This majestic little beauty will be the pet you always wanted and the life of any party. Who needs a cat?",
        image: "https://c1.staticflickr.com/7/6111/6869176460_795613ac05_b.jpg",
        category_id: category.id)

        expect(item).to be_invalid
      end

      it "is invalid without image" do
        item = Item.create(title: "miniture pony", description: "This majestic little beauty will be the pet you always wanted and the life of any party. Who needs a cat?",
        category_id: category.id)

        expect(item).to be_invalid
      end

      it "is invalid without category" do
        item = Item.create(title: "miniture pony", description: "This majestic little beauty will be the pet you always wanted and the life of any party. Who needs a cat?",
        image: "https://c1.staticflickr.com/7/6111/6869176460_795613ac05_b.jpg")

        expect(item).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with all attributes" do
        category = Category.create(title: "Animals")
        item = Item.create(title: "miniture pony", price: 19999.99, description: "This majestic little beauty will be the pet you always wanted and the life of any party. Who needs a cat?",
        image: "https://c1.staticflickr.com/7/6111/6869176460_795613ac05_b.jpg", category_id: category.id)

        expect(item).to be_valid
      end
    end
  end

  describe "relationships" do
    it "belongs to a category" do
      category = Category.create(title: "Animals")
      item = Item.create(title: "miniture pony", price: 19999.99, description: "This majestic little beauty will be the pet you always wanted and the life of any party. Who needs a cat?",
      image: "https://c1.staticflickr.com/7/6111/6869176460_795613ac05_b.jpg", category_id: category.id)

      expect(item).to respond_to(:category)
    end
  end
end
