require 'rails_helper'

RSpec.feature "When a user visits the visits the home page they see content", type: :feature do
  context "When the user visits the home page as a guest" do
    let(:category) {Category.create!(title: "Animals")}
    scenario "User sees main content" do
      item_1 = Item.create!(title: "Tiny Racer", description: "For the middleaged man who still love RC Cars.",
                            price: 79999.99, image: "https://s-media-cache-ak0.pinimg.com/564x/fa/ec/95/faec95496196ee63fcc61426d32ffb24.jpg",
                            category_id: category.id)
      item_2 = Item.create!(title: "Tea Cup Pig", description: "This majestic little beauty will be the pet you always wanted and the life of any party. Who needs a cat?",
                            price: 199.99, image: "http://www.newfoundreads.com/wp-content/uploads/2016/04/teacup-pig-1.jpg",
                            category_id: category.id)
      item_3 = Item.create(title: "Tiny Dog", description: "Ever wanted a guard dog that you could take with you? Ever got tired of having to recharge the batteries in your tazer? Get this little fella that can fit in your purse and never feel unsafe again.",
                           price: 299.99, image: "http://www.dogbreedplus.com/dog_breeds/images/White-and-Grey-Pomsky.jpg",
                           category_id: category.id, retired: false)

      visit root_path

      expect(page).to have_content("Welcome to the Mini Market!")
      expect(page).to have_content("Featured Items")
      expect(page).to have_content("Tea Cup Pig")
      expect(page).to have_content("Tiny Racer")
      expect(page).to have_content("Tiny Dog")
      expect(page).to have_content(199.99)
      expect(page).to have_content(79999.99)
      expect(page).to have_content(299.99)
      expect(page).to have_content("For the middleaged man who still love RC Cars.")
      expect(page).to have_content("This majestic little beauty will be the pet you always wanted and the life of any party. Who needs a cat?")
      expect(page).to have_content("Ever wanted a guard dog that you could take with you? Ever got tired of having to recharge the batteries in your tazer? Get this little fella that can fit in your purse and never feel unsafe again.")
      expect(page).to have_content("Tiny Racer")
    end

    scenario "User sees information specific to a guest" do
      visit root_path

      expect(page).to have_content("Log In | Sign Up")
    end
  end

  context "When a user visits the home page after logging in" do
    let(:user) {User.create!(name: "John Smith", email: "jo@jo.com", password: "1234567", password_confirmation: "1234567")}
    scenario "user sees infromation specific to authenticated users" do
      visit login_path

      fill_in :session_email, with: user.email
      fill_in :session_password, with: user.password

      click_button "Login"

      visit root_path

      expect(page).to have_content("Welcome to the Mini Market, John Smith!")
      expect(page).to have_content("Logout")
      expect(page).to have_content("Logged in as John Smith")
    end
  end
end
