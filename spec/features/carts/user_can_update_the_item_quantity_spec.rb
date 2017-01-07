require 'rails_helper'

RSpec.feature "When a user updates the quantity of an item in the cart", type: :feature do
  let(:category) {Category.create!(title: "Animals")}
  before(:each) do
    item_1 = Item.create(title: "Miniature Pony", price: 19999.99, description: "This majestic little beauty will be the pet you always wanted and the life of any party. Who needs a cat?",
    image: "https://c1.staticflickr.com/7/6111/6869176460_795613ac05_b.jpg", category_id: category.id)

  end

  scenario "the quantity of the item in the cart is changed" do
    visit items_path
    click_button "Add to Cart"
    click_button "Add to Cart"

    visit cart_path
    select "22", from: :cart_item_quantity
    click_button('Update')

    expect(page).to have_content(22)
  end

  scenario "the subtotal of the item in the cart is changed" do
    visit items_path
    click_button "Add to Cart"
    click_button "Add to Cart"

    visit cart_path
    select "22", from: :cart_item_quantity
    click_button('Update')

    expect(page).to have_content(439999.78)
  end
end
