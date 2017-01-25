require 'rails_helper'

describe Category do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without title" do
        category = Category.create()

        expect(category).to be_invalid
      end
    end
    context "valid attributes" do
      it "is valid with a title" do
        category = Category.create(title: "Animals")

        expect(category).to be_valid
      end
    end
  end

  describe "relationships" do
    it "has many items" do
      category = Category.create(title: "Animals")
      item = Item.create(title: "miniture pony", price: 19999.99, description: "This majestic little beauty will be the pet you always wanted and the life of any party. Who needs a cat?",
      image: "https://c1.staticflickr.com/7/6111/6869176460_795613ac05_b.jpg", category_id: category.id)

      expect(category).to respond_to(:items)
    end
  end
end
