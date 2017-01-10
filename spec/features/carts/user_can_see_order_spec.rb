require 'rails_helper'

RSpec.feature "When a logged in user checks out an item", type: :feature do
  let(:category) {Category.create!(title: "Animals")}
  before(:each) do
    item_1 = Item.create(title: "Miniature Pony", price: 19999.99, description: "This majestic little beauty will be the pet you always wanted and the life of any party. Who needs a cat?",
    image: "https://c1.staticflickr.com/7/6111/6869176460_795613ac05_b.jpg", category_id: category.id)
    user_1 = User.create!(name: "John Smith", email: "jo@jo.com", password: "1234567", password_confirmation: "1234567")
  end

  context "An item is checked out from the cart" do
    scenario "An item is checked out and shown in the orders page" do

      visit root_path
      click_link "Log In | Sign Up"
      expect(current_path).to eq(login_path)
      fill_in :session_email, with: "jo@jo.com"
      fill_in :session_password, with: "1234567"
      click_button "Login"

      visit items_path
      click_button "Add to Cart"
      click_button "Add to Cart"

      visit cart_path

      click_button "Checkout"

      expect(page).to have_content("Miniature Pony")
      expect(page).to have_content("This majestic little beauty will be the pet you always wanted and the life of any party. Who needs a cat?")
      expect(page).to have_content(19999.99)
      expect(page).to have_content(1)
      # expect(page).to have_content("Order Total: $19999.99")
      # expect(page).to have_content("Continue Shopping")
      expect(page).to_not have_selector(:link_or_button, "Checkout")
    end
  end
end
