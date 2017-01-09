require 'rails_helper'

describe "User sees the specific item information on the item page" do
  let(:category) {Category.create!(title: "Animals")}
  scenario "a user sees all the items" do
    item = Item.create!(title: "Tiny Racer", description: "For the middleaged man who still love RC Cars.",
    price: 79999.99, image: "https://s-media-cache-ak0.pinimg.com/564x/fa/ec/95/faec95496196ee63fcc61426d32ffb24.jpg",
    category_id: category.id)

    visit item_path(item.id)

    expect(page).to have_content("Tiny Racer")
    expect(page).to have_content(79999.99)
    expect(page).to have_content("For the middleaged man who still love RC Cars.")
  end
end
