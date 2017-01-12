require 'rails_helper'

RSpec.feature "When a logged in user checks out an item", type: :feature do
  before(:all) do
    category = Category.create(title: "Animals")
    @item = Item.create(title: "Miniature Pony", description: "This majestic little beauty will be the pet you always wanted and the life of any party. Who needs a cat?",
    price: 19999.99, image: "https://c1.staticflickr.com/7/6111/6869176460_795613ac05_b.jpg",
    category_id: category.id)
    data = Hash.new(0)
    data[@item.id] = 2
    @cart = Cart.new(data)
  end

  context "An item is checked out from the cart" do
    xscenario "An item is checked out and shown in the specific orders page" do
      user_1 = User.create!(name: "John Smith", email: "jo@jo.com", password: "1234567", password_confirmation: "1234567")
      visit root_path
      click_link "Log In | Sign Up"
      expect(current_path).to eq(login_path)
      fill_in :session_email, with: "jo@jo.com"
      fill_in :session_password, with: "1234567"
      click_button "Login"

      visit item_path(@item)
      click_button "Add to Cart"
      click_button "Add to Cart"

      visit cart_path

      click_link "Checkout"

      expect(page).to have_content("Miniature Pony")
      expect(page).to have_content("This majestic little beauty will be the pet you always wanted and the life of any party. Who needs a cat?")
      expect(page).to have_content(19999.99)
      expect(page).to have_content(1)
      expect(page).to have_content("Order Total: $39999.98")
      expect(page).to have_selector(:link_or_button, "Continue Shopping")
      expect(page).to have_selector(:link_or_button, "Back to Order History")
      expect(page).to_not have_selector(:link_or_button, "Checkout")
    end
  end

  context "When looking at order history users see all orders" do
    xscenario "An item is checked out and shown in the orders page" do
      user_1 = User.create!(name: "John Smith", email: "jo@jo.com", password: "1234567", password_confirmation: "1234567")


      visit root_path
      click_link "Log In | Sign Up"
      expect(current_path).to eq(login_path)
      fill_in :session_email, with: "jo@jo.com"
      fill_in :session_password, with: "1234567"
      click_button "Login"

      visit item_path(@item)
      click_button "Add to Cart"

      visit cart_path

      click_link "Checkout"
      save_and_open_page


      expect(current_path).to eq(orders_path)
      expect(page).to have_selector(:link_or_button, "Continue Shopping")
      expect(page).to have_selector(:link_or_button, "View Order")
    end
  end
end
