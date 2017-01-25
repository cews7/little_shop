require 'rails_helper'

RSpec.feature "User can log out" do
  scenario "successfully logged out" do
    user_1 = User.create!(name: "John Smith", email: "jo@jo.com", password: "1234567", password_confirmation: "1234567")
    visit root_path

    click_link "Log In | Sign Up"
    expect(current_path).to eq(login_path)

    fill_in :session_email, with: "jo@jo.com"
    fill_in :session_password, with: "1234567"

    click_button "Login"

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content("Welcome to the Mini Market, #{user_1.name}")

    click_link "Logout"

    expect(current_path).to eq(root_path)
    expect(page).to have_content("Welcome to the Mini Market!")
  end
end
