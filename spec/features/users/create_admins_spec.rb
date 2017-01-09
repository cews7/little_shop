require 'rails_helper'

describe "Admin visits the admin page" do
  context "as admin" do
    it "allows admin to see the admin page" do
      admin = User.create!(name: "John Smith", email: "jo@jo.com", password: "1234567", password_confirmation: "1234567", role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(:admin)
      visit admin_dashboard_index_path
      expect(page).to have_content("Admin Page")
    end
  end
  context "as default user" do
    it "default users can not see the admin page" do
      user = User.create(name: "John Smith", email: "sample2@sample.com", password_digest: "1234567", password_digest_confirmation: "1234567", role: 0)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(:default)
      visit admin_dashboard_index_path
      expect(page).to_not have_content("Admin Page")
      expect(page).to have_content("You are being redirected")
    end
  end
end
