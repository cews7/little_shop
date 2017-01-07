require "rails_helper"

RSpec.feature "When a user logs in on the cart page they see new information" do
  let(:user) {User.create!(name: "John Smith", email: "jo@jo.com", password: "1234567", password_confirmation: "1234567")}

  scenario "a user doesn't see logout functionality" do
    visit cart_path

    expect(page).to have_content("Log In | Sign Up to Checkout")
  end

  scenario "a user sees logout functionality after logging in" do
    visit cart_path

    expect(page).to have_content("Log In | Sign Up to Checkout")
    click_link("Log In | Sign Up to Checkout")

    expect(current_path).to eq(login_path)
    fill_in :session_email, with: user.email
    fill_in :session_password, with: user.password

    click_button("Login")

    visit cart_path

    expect(page).to have_content("Checkout")
  end
end
