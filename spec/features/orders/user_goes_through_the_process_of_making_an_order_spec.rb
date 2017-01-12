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

  context "A user goes through the checkout process" do
    scenario "An item is checked out and you are taken to the shipping information page" do
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

      expect(current_path).to eq(new_info_path)
      expect(page).to have_content("Add Shipping Information")
      expect(page).to have_content("Name")
      expect(page).to have_content("Address")
      expect(page).to have_content("City")
      expect(page).to have_content("State/Province")
      expect(page).to have_content("Postal Code")
      expect(page).to have_content("Country")
      expect(page).to have_selector(:link_or_button, 'Complete Checkout')
    end

    scenario "After filling out the shipping information a user is taken to a confirmation page" do
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

      fill_in "info[name]", with: user_1.name
      fill_in "info[address]", with: "1234 Something Ave"
      fill_in "info[city]", with: "Boston"
      fill_in "info[state]", with: "MA"
      fill_in "info[postal_code]", with: "02093"
      fill_in "info[country]", with: "US"
      click_button "Complete Checkout"

      expect(current_path).to eq(new_order_path)
      expect(page).to have_content("John Smith")
      expect(page).to have_content("1234 Something Ave")
      expect(page).to have_content("Boston")
      expect(page).to have_content("MA")
      expect(page).to have_content("02093")
      expect(page).to have_content("US")
      expect(page).to have_content(@item.title)
      expect(page).to have_content(@item.description)
      expect(page).to have_content(@item.price)
      expect(page).to have_selector(:link_or_button, 'Confirm')
      expect(page).to have_selector(:link_or_button, 'Edit Shipping Information')
    end

    scenario "After entering their shipping information they go to the order page" do
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

      fill_in "info[name]", with: user_1.name
      fill_in "info[address]", with: "1234 Something Ave"
      fill_in "info[city]", with: "Boston"
      fill_in "info[state]", with: "MA"
      fill_in "info[postal_code]", with: "02093"
      fill_in "info[country]", with: "US"
      click_button "Complete Checkout"

      click_button "Confirm"

      expect(page).to have_content(@item.title)
      expect(page).to have_content(@item.description)
      expect(page).to have_content(@item.price)
    end

    scenario "After entering their shipping info if the click Edit Shipping Information they are taken back to the Shipping Information page" do
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

      fill_in "info[name]", with: user_1.name
      fill_in "info[address]", with: "1234 Something Ave"
      fill_in "info[city]", with: "Boston"
      fill_in "info[state]", with: "MA"
      fill_in "info[postal_code]", with: "02093"
      fill_in "info[country]", with: "US"
      click_button "Complete Checkout"

      click_link "Edit Shipping Information"

      expect(current_path).to eq(new_info_path)
    end
  end

  context "When looking at order history users see all orders" do
    scenario "An item is checked out and shown in the orders page" do
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

      fill_in "info[name]", with: user_1.name
      fill_in "info[address]", with: "1234 Something Ave"
      fill_in "info[city]", with: "Boston"
      fill_in "info[state]", with: "MA"
      fill_in "info[postal_code]", with: "02093"
      fill_in "info[country]", with: "US"
      click_button "Complete Checkout"

      click_button "Confirm"

      click_link "Back to Order History"

      expect(current_path).to eq(orders_path)

      expect(page).to have_content("Order History")
      expect(page).to have_selector(:link_or_button, 'Continue Shopping')

    end
  end
end
