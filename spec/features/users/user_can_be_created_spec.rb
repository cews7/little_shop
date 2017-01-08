require 'rails_helper'

describe "Visitor can create an account" do
  it "user is created" do
    visit root_path
    click_link "Log In | Sign Up"

    expect(current_path).to eq(login_path)

    click_link "New? Create an Account!"

    expect(current_path).to eq(new_user_path)
    email    = "sample@sample.com"
    password = "1234567"
    name     = "John Smith"
    fill_in "user[name]", with: name
    fill_in "user[email]", with: email
    fill_in "user[password]", with: password
    fill_in "user[password_confirmation]", with: password
    click_button "Create Account!"

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content("Welcome to the Mini Market, John Smith!")
  end
end
