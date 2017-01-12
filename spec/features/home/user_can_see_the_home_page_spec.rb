require 'rails_helper'

RSpec.feature "When a user visits the visits the home page they see content", type: :feature do
  context "When the user visits the home page as a guest" do
    let(:category) {Category.create!(title: "Animals")}

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
