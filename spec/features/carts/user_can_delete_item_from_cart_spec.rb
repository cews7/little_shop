require 'rails_helper'

RSpec.feature "When a user deletes an item from the cart", type: :feature do
  let(:category) {Category.create!(title: "Animals")}
  before(:each) do
    @item_1 = Item.create(title: "Miniature Pony", price: 19999.99, description: "This majestic little beauty will be the pet you always wanted and the life of any party. Who needs a cat?",
                         image: "https://c1.staticflickr.com/7/6111/6869176460_795613ac05_b.jpg", category_id: category.id)
  end

  scenario "the user deletes and item from the cart" do
    visit items_path

    page.find("#item_#{@item_1.id}").click

    visit cart_path
    click_button('Delete from Cart')
    expect(page).to have_content("Miniature Pony, successfully removed from cart!")
    expect(current_path).to eq(cart_path)
    expect(page).to_not have_content("This majestic little beauty will be the pet you always wanted and the life of any party. Who needs a cat?")
    # expect(page).to have_content("You have successfully deleted #{item_1.title}")
  end
end
