require 'rails_helper'

describe "Admin visits the admin page" do
  context "as admin" do
    it "allows admin to see the admin page" do
      admin =User.create(name: "John Smith", email: "john@smith.com", password: "1234567", password_confirmation: "1234567", role: 1)

      visit root_path

      click_link "Log In | Sign Up"

      fill_in :session_email, with: "john@smith.com"
      fill_in :session_password, with: "1234567"

      click_button "Login"

      expect(page).to have_content("Admin Dashboard")
      expect(page).to_not have_content("You are being redirected")
    end
  end
  context "as default user" do
    it "default users can not see the admin page" do
      user_1 = User.create!(name: "John Smith", email: "jo@jo.com", password: "1234567", password_confirmation: "1234567")
      visit root_path

      click_link "Log In | Sign Up"

      fill_in :session_email, with: "jo@jo.com"
      fill_in :session_password, with: "1234567"

      click_button "Login"

      visit admin_dashboard_index_path

      expect(page).to_not have_content("Admin Dashboard")
      expect(page).to have_content("You are being redirected")
    end
  end
  context "as non-logged in user" do
    it "non-logged in users cannot see the admin page" do
      visit admin_dashboard_index_path

      expect(page).to_not have_content("Admin Dashboard")
      expect(page).to have_content("You are being redirected")
    end
  end
end
