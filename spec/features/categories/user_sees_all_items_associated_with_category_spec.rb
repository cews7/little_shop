require 'rails_helper'

describe "User sees all items associated with given category" do
  it "all items in that category appear" do
    category = Category.create!(title: "Animals")

    item_1 = Item.create!(title: "Tea Cup Pig",
    description: "This majestic little beauty will be the pet you always wanted and the life of any party. Who needs a cat?",
    price: 199.99, image: "http://www.newfoundreads.com/wp-content/uploads/2016/04/teacup-pig-1.jpg",
    category_id: category.id)

    visit category_items_path(category.id)

    expect(page).to have_content("Tea Cup Pig")
    expect(page).to have_content("This majestic little beauty will be the pet you always wanted and the life of any party. Who needs a cat?")
    expect(page).to have_content(199.99)
  end
end
