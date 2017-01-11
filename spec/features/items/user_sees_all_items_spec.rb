require 'rails_helper'

describe "User sees all items" do
  let(:category) {Category.create!(title: "Animals")}
  scenario "a user sees all the items" do
    item_1 = Item.create!(title: "Tiny Racer", description: "For the middleaged man who still love RC Cars.",
                          price: 79999.99, image: "https://s-media-cache-ak0.pinimg.com/564x/fa/ec/95/faec95496196ee63fcc61426d32ffb24.jpg",
                          category_id: category.id)
    item_2 = Item.create!(title: "Tea Cup Pig", description: "This majestic little beauty will be the pet you always wanted and the life of any party. Who needs a cat?",
                          price: 199.99, image: "http://www.newfoundreads.com/wp-content/uploads/2016/04/teacup-pig-1.jpg",
                          category_id: category.id)

    visit items_path

    expect(page).to have_content("Tiny Racer")
    expect(page).to have_content(79999.99)
    expect(page).to have_content("For the middleaged man who still love RC Cars.")
    expect(page).to have_content("Tea Cup Pig")
    expect(page).to have_content(199.99)
    expect(page).to have_content("This majestic little beauty will be the pet you always wanted and the life of any party. Who needs a cat?")
  end
end
