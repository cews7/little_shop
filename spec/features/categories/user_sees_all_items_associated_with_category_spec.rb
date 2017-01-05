require 'rails_helper'

describe "User sees all items associated with given category" do
  it "all items in that category appear" do
    category_1 = Category.create!(title: "Animals")
    category_2 = Category.create!(title: "Cars")

    item_1 = Item.create!(title: "Tea Cup Pig",
    description: "This majestic little beauty will be the pet you always wanted and the life of any party. Who needs a cat?",
    price: 199.99, image: "http://www.newfoundreads.com/wp-content/uploads/2016/04/teacup-pig-1.jpg",
    category_id: category_1.id)

    item_2 = Item.create!(title: "Tiny Sportscar", description: "Tired of having a hard time finding parking downtown but still want to look cool in a sportscar? look no further.",
     price: 299.99, image: "https://s-media-cache-ak0.pinimg.com/236x/2f/cb/b9/2fcbb9a477214eb0c2cf912914b3f023.jpg",
     category_id: category_2.id)

    visit category_items_path(category_1.id)

    expect(page).to have_content("Tea Cup Pig")
    expect(page).to have_content("This majestic little beauty will be the pet you always wanted and the life of any party. Who needs a cat?")
    expect(page).to have_content(199.99)
  end
end
