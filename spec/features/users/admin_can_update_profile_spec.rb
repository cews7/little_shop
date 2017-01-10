require 'rails_helper'

describe "Admin visits the admin dashboard page" do
  context "as admin" do
    it "allows admin to edit profile" do
      admin =User.create(name: "John Smith", email: "john@smith.com", password: "1234567", password_confirmation: "1234567", role: 1)

      visit root_path

      click_link "Log In | Sign Up"

      fill_in :session_email, with: "john@smith.com"
      fill_in :session_password, with: "1234567"

      click_button "Login"

      expect(page).to have_content("Admin Dashboard")
      expect(page).to_not have_content("You are being redirected")

      click_link "Edit Admin Account"

      fill_in :user_name, with: "John2"
      fill_in :user_email, with: "john2@smith.com"
      fill_in :user_password, with: "1234567"
      fill_in :user_password_confirmation, with: "1234567"

      click_button "Edit Admin Account!"

      expect(current_path).to eq(admin_dashboard_index_path)
      expect(page).to have_content("John2")
      expect(page).to have_content("john2@smith.com")
      expect(page).to have_content("Admin profile successfully updated!")
    end


    it "does not allows admin to edit profile when name is empty" do
      admin =User.create(name: "John Smith", email: "john@smith.com", password: "1234567", password_confirmation: "1234567", role: 1)

      visit root_path

      click_link "Log In | Sign Up"

      fill_in :session_email, with: "john@smith.com"
      fill_in :session_password, with: "1234567"

      click_button "Login"

      expect(page).to have_content("Admin Dashboard")
      expect(page).to_not have_content("You are being redirected")

      click_link "Edit Admin Account"

      fill_in :user_email, with: "john2@smith.com"
      fill_in :user_password, with: "1234567"
      fill_in :user_password_confirmation, with: "1234567"

      click_button "Edit Admin Account!"
      save_and_open_page

      expect(current_path).to eq(edit_admin_dashboard_path)
      expect(page).to_not have_content("john2@smith.com")
      expect(page).to have_content("Admin profile has NOT been updated!")
    end
  end
end
