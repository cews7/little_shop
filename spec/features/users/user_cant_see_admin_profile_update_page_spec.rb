require 'rails_helper'

describe "Default user visits the admin edit profile page" do
  context "as default user" do
    it "does not allow default user to see the admin page" do

    user = User.create!(name: "John Smith", email: "jo@jo.com", password: "1234567", password_confirmation: "1234567")
    admin = User.create!(name: "John Smith", email: "jo2@jo.com", password: "1234567", password_confirmation: "1234567", role: 1)

    visit root_path

    click_link "Log In | Sign Up"

    fill_in :session_email, with: "jo@jo.com"
    fill_in :session_password, with: "1234567"

    click_button "Login"

    visit edit_admin_dashboard_path(admin.id)

    expect(page).to_not have_content("Edit Admin Account: Please fill in every field")
    expect(page).to have_content("You are being redirected")
    end
  end
end
