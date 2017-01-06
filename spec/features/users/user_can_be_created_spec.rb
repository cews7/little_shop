require 'rails_helper'

describe "Visitor can create an account" do
  it "user is created" do
    visit root_path
    click_button "Login"

    expect(current_path).to eq(login_path)

    select "New User? Create an Account!", from: "Login"

    expect(current_path).to eq(new_user_path)
    email    = "sample@sample.com"
    password = "1234"
    name     = "John Smith"
    fill_in "Name", with: name
    fill_in "Email", with: email
    fill_in "Password", with: password
    fill_in "Confirm Password", with: password
    click_button "Create Account!"

    expect(current_path).to eq(root_path)
    expect(page).to have_content("Welcome to the Mini Market, John Smith!")
  end
end
