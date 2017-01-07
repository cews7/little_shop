require 'rails_helper'

RSpec.feature "When a user clicks on the links in the nav bar it takes you to the expected page", type: :feature do

  it "user clicks on the logo button in the navbar" do
    visit cart_path
    within(".navbar-header") do
      click_link("Minimarket logo")
    end

    expect(current_path).to eq(root_path)
  end

  it "user clicks on the categories button in the navbar" do
    visit root_path

    within(".navbar-header") do
      click_on("btn_categories")
    end

    expect(current_path).to eq(categories_path)
  end
end
