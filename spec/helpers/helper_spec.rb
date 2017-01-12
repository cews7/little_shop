require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the ChargesHelper. For example:
#
# describe ChargesHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe ChargesHelper, type: :helper do

  xcontext "cart total" do


  end

  context "subtotal" do
    it "finds the subtotal for an item"
    item = Item.create(title: "Miniature Pony", description: "This majestic little beauty will be the pet you always wanted and the life of any party. Who needs a cat?",
              price: 19999.99, image: "https://c1.staticflickr.com/7/6111/6869176460_795613ac05_b.jpg",
              category_id: category_objects[0].id, retired: false)
  end

end
