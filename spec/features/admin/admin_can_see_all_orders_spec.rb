require 'rails_helper'

RSpec.feature "Admin visits the admin page" do
  before(:all) do
    category = Category.create(title: "Animals")
    @item_1 = Item.create!(title: "Miniature Pony", description: "This majestic little beauty will be the pet you always wanted and the life of any party. Who needs a cat?",
                          price: 19999.99, image: "https://c1.staticflickr.com/7/6111/6869176460_795613ac05_b.jpg",
                          category_id: category.id)
    @item_2 = Item.create!(title: "Tiny Racer", description: "For the middleaged man who still love RC Cars.",
                          price: 79999.99, image: "https://s-media-cache-ak0.pinimg.com/564x/fa/ec/95/faec95496196ee63fcc61426d32ffb24.jpg",
                          category_id: category.id)
    data_1 = Hash.new(0)
    data_2 = Hash.new(0)

    data_1[@item_1.id] = 2
    data_2[@item_2.id] = 5

    cart_1 = Cart.new(data_1)
    cart_2 = Cart.new(data_2)

    @order_1 = Order.create
    @order_2 = Order.create

    @order_3 = data_1.map do |item_id, quantity|
      @order_1.order_items.create(item_id: item_id, quantity: quantity)
    end

    @order_4 = data_2.map do |item_id, quantity|
      @order_2.order_items.create(item_id: item_id, quantity: quantity)
    end
  end

  context "as admin on the dashboard page" do
    it "allows admin to see all orders" do
      admin =User.create(name: "John Smith", email: "john@smith.com", password: "1234567", password_confirmation: "1234567", role: 1)

      visit root_path

      click_link "Log In | Sign Up"

      fill_in :session_email, with: "john@smith.com"
      fill_in :session_password, with: "1234567"

      click_button "Login"

      expect(current_path).to eq(admin_dashboard_index_path)
      expect(page).to have_content("Admin Dashboard")
      expect(page).to have_content("John Smith")
      expect(page).to have_content("john@smith.com")
      expect(page).to have_content(@order_1.id)
      expect(page).to have_content(@order_2.id)
      expect(page).to have_content(@order_1.status)
      expect(page).to have_content(@order_2.status)
    end

    it "admin can click on a button and view a specific order" do
      admin =User.create(name: "John Smith", email: "john@smith.com", password: "1234567", password_confirmation: "1234567", role: 1)

      visit root_path

      click_link "Log In | Sign Up"

      fill_in :session_email, with: "john@smith.com"
      fill_in :session_password, with: "1234567"

      click_button "Login"

      page.find("#order_#{@order_1.id}").click

      expect(current_path).to eq(admin_order_path(@order_1.id))
      expect(page).to have_content(@item_1.title)
      expect(page).to have_content(@item_1.price)
      expect(page).to have_content(@item_1.description)
      expect(page).to have_content(@order_3.first.quantity)
      expect(page).to have_content(@order_1.status)

      expect(page).to_not have_content(@item_2.title)
      expect(page).to_not have_content(@item_2.price)
      expect(page).to_not have_content(@item_2.description)
      expect(page).to_not have_content(@order_4.first.quantity)
    end
  end

  context "from the order show page" do
    scenario "fan admin can update the status of the order" do
      admin =User.create(name: "John Smith", email: "john@smith.com", password: "1234567", password_confirmation: "1234567", role: 1)

      visit root_path

      click_link "Log In | Sign Up"

      fill_in :session_email, with: "john@smith.com"
      fill_in :session_password, with: "1234567"

      click_button "Login"

      page.find("#order_#{@order_1.id}").click

      expect(current_path).to eq(admin_order_path(@order_1.id))
      expect(page).to         have_content("Ordered")
      expect(page).to_not     have_content("Paid")

      page.find("#Paid").click

      expect(current_path).to eq(admin_order_path(@order_1.id))
      expect(page).to         have_content("Paid")
      expect(page).to_not     have_content("Ordered")
    end

    scenario "admin can go back to the admin dashboard by clicking on the back to admin dashboard button" do
      admin =User.create(name: "John Smith", email: "john@smith.com", password: "1234567", password_confirmation: "1234567", role: 1)

      visit root_path

      click_link "Log In | Sign Up"

      fill_in :session_email, with: "john@smith.com"
      fill_in :session_password, with: "1234567"

      click_button "Login"

      page.find("#order_#{@order_1.id}").click

      page.find("#Admin").click

      expect(current_path).to eq(admin_dashboard_index_path)
    end
  end
end
