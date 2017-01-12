require 'rails_helper'

RSpec.describe Info, type: :model do
  describe "validations" do
    context "invalid attributes when creating user info" do
      it "is invalid without a name" do
        info = Info.create(address: "11 Sample Way", city: "Sample", state: "CO", postal_code: "80238", country: "USA")

        expect(info).to be_invalid
      end
    end
  end
end
