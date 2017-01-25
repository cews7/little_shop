require 'rails_helper'

RSpec.feature "Cart empties when user logs out" do
  let(:category) {Category.create!(title: "Animals")}

  scenario "successfully logged out" do

    item_1 = Item.create(title: "Miniature Pony", price: 19999.99, description: "This majestic little beauty will be the pet you always wanted and the life of any party. Who needs a cat?",
                         image: "https://c1.staticflickr.com/7/6111/6869176460_795613ac05_b.jpg", category_id: category.id)
    user_1 = User.create!(name: "John Smith", email: "jo@jo.com", password: "1234567", password_confirmation: "1234567")

    visit item_path(item_1.id)
    click_button "Add to Cart"

    click_link "Log In | Sign Up"
    expect(current_path).to eq(login_path)

    fill_in :session_email, with: "jo@jo.com"
    fill_in :session_password, with: "1234567"

    click_button "Login"

    expect(current_path).to eq(dashboard_path)

    click_link "Logout"

    expect(current_path).to eq(root_path)
    expect(page).to have_content("Welcome to the Mini Market!")
    expect(page).to have_content("Cart ()")
  end
end
