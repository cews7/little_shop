require 'rails_helper'

describe "Admin visits the admin individual order page" do
  before(:all) do
    admin = User.create(name: "John Smith", email: "john@smith.com", password: "1234567", password_confirmation: "1234567", role: 1)
    category = Category.create(title: "Animals")
    @item_1 = Item.create!(title: "Miniature Pony", description: "This majestic little beauty will be the pet you always wanted and the life of any party. Who needs a cat?",
    price: 19999.99, image: "https://c1.staticflickr.com/7/6111/6869176460_795613ac05_b.jpg",
    category_id: category.id)

    data_1 = Hash.new(0)

    data_1[@item_1.id] = 2

    cart_1 = Cart.new(data_1)

    @order_1 = Order.create

    @order_2 = data_1.map do |item_id, quantity|
      @order_1.order_items.create(item_id: item_id, quantity: quantity)
    end
    customer_info = Info.create(name: "John", address: "11 Sample Way", city: "Sample", state: "CO", postal_code: "80238", country: "USA")
    @order_1.info = customer_info
    @order_1.save
  end

  context "as admin" do
    it "allows admin to see all individual order pages" do

      visit root_path

      click_link "Log In | Sign Up"

      fill_in :session_email, with: "john@smith.com"
      fill_in :session_password, with: "1234567"

      click_button "Login"

      expect(page).to have_content("Admin Dashboard")
      expect(page).to_not have_content("You are being redirected")

      click_link "View Order"

      expect(current_path).to eq(admin_order_path(@order_1.id))
      expect(page).to have_content("Order Date")
      expect(page).to have_content("Order Time")
      expect(page).to have_content("Purchaser: John")
      expect(page).to have_content("Shipping Address: 11 Sample Way")
      expect(page).to have_content("Shipping City: Sample")
      expect(page).to have_content("Shipping State: CO")
      expect(page).to have_content("Shipping Zipcode: 80238")
      expect(page).to have_content("Country: USA")
      expect(page).to have_content("Order Total: $39999.98")
      expect(page).to have_content("Miniature Pony")
      expect(page).to have_content("This majestic little beauty will be the pet you always wanted and the life of any party. Who needs a cat?")
      expect(page).to have_content("Price")
      expect(page).to have_content("19999.99")
      expect(page).to have_content("Quantity")
      expect(page).to have_content("2")
      expect(page).to have_content("Subtotal")
    end


    it "allows admin to see cancel an order" do
      visit root_path

      click_link "Log In | Sign Up"

      fill_in :session_email, with: "john@smith.com"
      fill_in :session_password, with: "1234567"

      click_button "Login"

      expect(page).to have_content("Admin Dashboard")
      expect(page).to_not have_content("You are being redirected")

      click_link "View Order"

      expect(current_path).to eq(admin_order_path(@order_1.id))

      click_button "Cancel"

      expect(current_path).to eq(admin_order_path(@order_1.id))
      expect(page).to have_content("Order has been Canceled")
      expect(page).to have_content("Order Status: Canceled")

      click_link "Back to Admin Dashboard"
      expect(current_path).to eq(admin_dashboard_index_path)
    end

  it "allows admin to mark order as paid" do
      visit root_path

      click_link "Log In | Sign Up"

      fill_in :session_email, with: "john@smith.com"
      fill_in :session_password, with: "1234567"

      click_button "Login"

      expect(page).to have_content("Admin Dashboard")
      expect(page).to_not have_content("You are being redirected")

      click_link "View Order"

      expect(current_path).to eq(admin_order_path(@order_1.id))

      click_button "Mark as Paid"

      expect(current_path).to eq(admin_order_path(@order_1.id))
      expect(page).to have_content("Order Status: Paid")
      expect(page).to have_button("Completed")

      click_button "Completed"

      expect(current_path).to eq(admin_order_path(@order_1.id))
      expect(page).to have_content("Order has been Completed")
      expect(page).to have_content("Order Status: Completed")
    end

    it "admin can go back to admin dashboard page" do
          visit root_path

          click_link "Log In | Sign Up"

          fill_in :session_email, with: "john@smith.com"
          fill_in :session_password, with: "1234567"

          click_button "Login"

          expect(page).to have_content("Admin Dashboard")
          expect(page).to_not have_content("You are being redirected")

          click_link "View Order"

          expect(current_path).to eq(admin_order_path(@order_1.id))

          click_link "Back to Admin Dashboard"
          expect(current_path).to eq(admin_dashboard_index_path)
    end
  end
end
