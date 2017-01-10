require 'rails_helper'

describe "Admin visits the admin dashboard page" do
  context "as admin" do
    it "allows admin to edit all profile fields" do
      admin = User.create(name: "John Smith", email: "john@smith.com", password: "1234567", password_confirmation: "1234567", role: 1)

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
      fill_in :user_password, with: "7654321"
      fill_in :user_password_confirmation, with: "7654321"

      click_button "Edit Admin Account!"

      expect(current_path).to eq(admin_dashboard_index_path)
      expect(page).to have_content("Admin Dashboard")
      expect(page).to have_content("John2")
      expect(page).to have_content("john2@smith.com")
      expect(page).to have_content("Admin profile successfully updated!")

      click_link "Logout"

      expect(current_path).to eq(root_path)

      click_link "Log In | Sign Up"

      fill_in :session_email, with: "john2@smith.com"
      fill_in :session_password, with: "7654321"
      click_button "Login"

      expect(current_path).to eq(admin_dashboard_index_path)
      expect(page).to have_content("John2")
      expect(page).to have_content("john2@smith.com")
      expect(page).to have_content("Logged in as Admin John2")
    end

    it "allows admin to edit name profile field" do
      admin = User.create(name: "John Smith", email: "john@smith.com", password: "1234567", password_confirmation: "1234567", role: 1)

      visit root_path

      click_link "Log In | Sign Up"

      fill_in :session_email, with: "john@smith.com"
      fill_in :session_password, with: "1234567"

      click_button "Login"

      expect(page).to have_content("Admin Dashboard")
      expect(page).to_not have_content("You are being redirected")

      click_link "Edit Admin Account"

      fill_in :user_name, with: "John2"
      fill_in :user_email, with: "john@smith.com"
      fill_in :user_password, with: "1234567"
      fill_in :user_password_confirmation, with: "1234567"

      click_button "Edit Admin Account!"

      expect(current_path).to eq(admin_dashboard_index_path)
      expect(page).to have_content("Admin Dashboard")
      expect(page).to have_content("John2")
      expect(page).to have_content("john@smith.com")
      expect(page).to have_content("Admin profile successfully updated!")

      click_link "Logout"

      expect(current_path).to eq(root_path)

      click_link "Log In | Sign Up"

      fill_in :session_email, with: "john@smith.com"
      fill_in :session_password, with: "1234567"
      click_button "Login"

      expect(current_path).to eq(admin_dashboard_index_path)
      expect(page).to have_content("John2")
      expect(page).to have_content("john@smith.com")
      expect(page).to have_content("Logged in as Admin John2")
    end

    it "allows admin to edit email profile field" do
      admin = User.create(name: "John Smith", email: "john@smith.com", password: "1234567", password_confirmation: "1234567", role: 1)

      visit root_path

      click_link "Log In | Sign Up"

      fill_in :session_email, with: "john@smith.com"
      fill_in :session_password, with: "1234567"

      click_button "Login"

      expect(page).to have_content("Admin Dashboard")
      expect(page).to_not have_content("You are being redirected")

      click_link "Edit Admin Account"

      fill_in :user_name, with: "John"
      fill_in :user_email, with: "john2@smith.com"
      fill_in :user_password, with: "1234567"
      fill_in :user_password_confirmation, with: "1234567"

      click_button "Edit Admin Account!"

      expect(current_path).to eq(admin_dashboard_index_path)
      expect(page).to have_content("Admin Dashboard")
      expect(page).to have_content("John2")
      expect(page).to have_content("john2@smith.com")
      expect(page).to have_content("Admin profile successfully updated!")

      click_link "Logout"

      expect(current_path).to eq(root_path)

      click_link "Log In | Sign Up"

      fill_in :session_email, with: "john2@smith.com"
      fill_in :session_password, with: "7654321"
      click_button"Login"

      expect(current_path).to eq(admin_dashboard_index_path)
      expect(page).to have_content("John2")
      expect(page).to have_content("john2@smith.com")
      expect(page).to have_content("Logged in as Admin John2")
    end

#     it "allows admin to edit password profile fields" do
#       admin = User.create(name: "John Smith", email: "john@smith.com", password: "1234567", password_confirmation: "1234567", role: 1)
#
#       visit root_path
#
#       click_link "Log In | Sign Up"
#
#       fill_in :session_email, with: "john@smith.com"
#       fill_in :session_password, with: "1234567"
#
#       click_button "Login"
#
#       expect(page).to have_content("Admin Dashboard")
#       expect(page).to_not have_content("You are being redirected")
#
#       click_link "Edit Admin Account"
#
#       fill_in :user_name, with: "John"
#       fill_in :user_email, with: "john@smith.com"
#       fill_in :user_password, with: "7654321"
#       fill_in :user_password_confirmation, with: "7654321"
#
#       click_button "Edit Admin Account!"
#
#       expect(current_path).to eq(admin_dashboard_index_path)
#       expect(page).to have_content("John")
#       expect(page).to have_content("john@smith.com")
#       expect(page).to have_content("Admin profile successfully updated!")
#
#       click_link "Logout"
#     end
#
#     it "does not allow admin to edit profile when passwords don't match" do
#       admin = User.create(name: "John Smith", email: "john@smith.com", password: "1234567", password_confirmation: "1234567", role: 1)
#
#       visit root_path
#
#       click_link "Log In | Sign Up"
#
#       fill_in :session_email, with: "john@smith.com"
#       fill_in :session_password, with: "1234567"
#
#       click_button "Login"
#
#       expect(page).to have_content("Admin Dashboard")
#       expect(page).to_not have_content("You are being redirected")
#
#       click_link "Edit Admin Account"
#
#       fill_in :user_name, with: "John"
#       fill_in :user_email, with: "john@smith.com"
#       fill_in :user_password, with: "1234567"
#       fill_in :user_password_confirmation, with: "12345678"
#
#       click_button "Edit Admin Account!"
#
#       expect(current_path).to eq(admin_dashboard_path(admin.id))
#       expect(page).to_not have_content("John")
#       expect(page).to_not have_content("john@smith.com")
#       expect(page).to have_content("Admin profile has NOT been updated!")
#     end
#
#
#     it "does not allow admin to edit profile when name is empty" do
#       admin = User.create(name: "John Smith", email: "john@smith.com", password: "1234567", password_confirmation: "1234567", role: 1)
#
#       visit root_path
#
#       click_link "Log In | Sign Up"
#
#       fill_in :session_email, with: "john@smith.com"
#       fill_in :session_password, with: "1234567"
#
#       click_button "Login"
#
#       expect(page).to have_content("Admin Dashboard")
#       expect(page).to_not have_content("You are being redirected")
#
#       click_link "Edit Admin Account"
#
#       fill_in :user_name, with: ""
#       fill_in :user_email, with: "john2@smith.com"
#       fill_in :user_password, with: "1234567"
#       fill_in :user_password_confirmation, with: "1234567"
#
#       click_button "Edit Admin Account!"
#
#       expect(current_path).to eq(admin_dashboard_path(admin.id))
#       expect(page).to_not have_content("john2@smith.com")
#       expect(page).to have_content("Admin profile has NOT been updated!")
#     end
#
#     it "does not allow admin to edit profile when email is empty" do
#       admin = User.create(name: "John Smith", email: "john@smith.com", password: "1234567", password_confirmation: "1234567", role: 1)
#
#       visit root_path
#
#       click_link "Log In | Sign Up"
#
#       fill_in :session_email, with: "john@smith.com"
#       fill_in :session_password, with: "1234567"
#
#       click_button "Login"
#
#       expect(page).to have_content("Admin Dashboard")
#       expect(page).to_not have_content("You are being redirected")
#
#       click_link "Edit Admin Account"
#
#       fill_in :user_name, with: "John2"
#       fill_in :user_email, with: ""
#       fill_in :user_password, with: "1234567"
#       fill_in :user_password_confirmation, with: "1234567"
#
#       click_button "Edit Admin Account!"
#
#       expect(current_path).to eq(admin_dashboard_path(admin.id))
#       expect(page).to_not have_content("John2")
#       expect(page).to have_content("Admin profile has NOT been updated!")
#     end
#
#     it "does not allow admin to edit profile when password is empty" do
#       admin = User.create(name: "John Smith", email: "john@smith.com", password: "1234567", password_confirmation: "1234567", role: 1)
#
#       visit root_path
#
#       click_link "Log In | Sign Up"
#
#       fill_in :session_email, with: "john@smith.com"
#       fill_in :session_password, with: "1234567"
#
#       click_button "Login"
#
#       expect(page).to have_content("Admin Dashboard")
#       expect(page).to_not have_content("You are being redirected")
#
#       click_link "Edit Admin Account"
#
#       fill_in :user_name, with: "John2"
#       fill_in :user_email, with: "john2@smith.com"
#       fill_in :user_password, with: ""
#       fill_in :user_password_confirmation, with: "1234567"
#
#       click_button "Edit Admin Account!"
#
#       expect(current_path).to eq(admin_dashboard_path(admin.id))
#       expect(page).to_not have_content("John2")
#       expect(page).to_not have_content("john2@smith.com")
#       expect(page).to have_content("Admin profile has NOT been updated!")
#     end
#
#     it "does not allow admin to edit profile when password confirmation is empty" do
#       admin = User.create(name: "John Smith", email: "john@smith.com", password: "1234567", password_confirmation: "1234567", role: 1)
#
#       visit root_path
#
#       click_link "Log In | Sign Up"
#
#       fill_in :session_email, with: "john@smith.com"
#       fill_in :session_password, with: "1234567"
#
#       click_button "Login"
#
#       expect(page).to have_content("Admin Dashboard")
#       expect(page).to_not have_content("You are being redirected")
#
#       click_link "Edit Admin Account"
#
#       fill_in :user_name, with: "John2"
#       fill_in :user_email, with: "john2@smith.com"
#       fill_in :user_password, with: "1234567"
#       fill_in :user_password_confirmation, with: ""
#
#       click_button "Edit Admin Account!"
#
#       expect(current_path).to eq(admin_dashboard_path(admin.id))
#       expect(page).to_not have_content("John2")
#       expect(page).to_not have_content("john2@smith.com")
#       expect(page).to have_content("Admin profile has NOT been updated!")
#     end
  end
end
