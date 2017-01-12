require 'rails_helper'

describe "Admin visits the admin items page" do
  let(:category) {Category.create!(title: "Animals")}
  admin = User.create(name: "John Smith", email: "john@smith.com", password: "1234567", password_confirmation: "1234567", role: "admin")
  context "as admin" do

    it "allows admin to one active item" do
      item_1 = Item.create!(title: "Tiny Racer", description: "For the middleaged man who still love RC Cars.",
                            price: 79999.99, image: "https://s-media-cache-ak0.pinimg.com/564x/fa/ec/95/faec95496196ee63fcc61426d32ffb24.jpg",
                            category_id: category.id)

      visit admin_items_path

      expect(page).to have_content("Manage Items")
      expect(page).to have_content("Tiny Racer")
      expect(page).to have_content("active")
      expect(page).to have_button("Edit")
    end

    it "allows admin to one retired item" do
      item_1 = Item.create!(title: "Tea Cup Pig", description: "This majestic little beauty will be the pet you always wanted and the life of any party. Who needs a cat?",
                            price: 199.99, image: "http://www.newfoundreads.com/wp-content/uploads/2016/04/teacup-pig-1.jpg",
                            category_id: category.id, retired: true)

      visit admin_items_path

      expect(page).to have_content("Manage Items")
      expect(page).to have_content("Tea Cup Pig")
      expect(page).to have_content("retired")
      expect(page).to have_button("Edit")
    end
  end

end
