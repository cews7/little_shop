require 'rails_helper'

RSpec.describe Info, type: :model do
  describe "validations" do
    context "invalid attributes when creating user info" do
      it "is invalid without a name" do
        info = Info.create(address: "11 Sample Way", city: "Sample", state: "CO", postal_code: "80238", country: "USA")

        expect(info).to be_invalid
      end

      it "is invalid without an address" do
        info = Info.create(name: "John", city: "Sample", state: "CO", postal_code: "80238", country: "USA")

        expect(info).to be_invalid
      end

      it "is invalid without a city" do
        info = Info.create(name: "John", address: "11 Sample Way", state: "CO", postal_code: "80238", country: "USA")

        expect(info).to be_invalid
      end

      it "is invalid without a state" do
        info = Info.create(name: "John", address: "11 Sample Way", city: "Sample", postal_code: "80238", country: "USA")

        expect(info).to be_invalid
      end

      it "is invalid without a postal code" do
        info = Info.create(name: "John", address: "11 Sample Way", city: "Sample", state: "CO", country: "USA")

        expect(info).to be_invalid
      end

      it "is invalid without a country" do
        info = Info.create(name: "John", address: "11 Sample Way", city: "Sample", state: "CO", postal_code: "80238")

        expect(info).to be_invalid
      end
    end

    context "valid attributes when creating user info" do
      it "is valid with all attributes" do
        info = Info.create(name: "John", address: "11 Sample Way", city: "Sample", state: "CO", postal_code: "80238", country: "USA")

        expect(info).to be_valid
      end
    end
  end
end
