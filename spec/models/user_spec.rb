require 'rails_helper'

describe User do
  describe "validations" do
    context "invalid attributes when creating a user" do
      it "is invalid without a name" do
        user = User.create(email: "sample@sample.com", password_digest: "1234567", password_digest_confirmation: "1234567")

        expect(user).to be_invalid
      end

      it "is invalid without an email" do
        user = User.create(name: "John Smith", password_digest: "1234567", password_digest_confirmation: "1234567")

        expect(user).to be_invalid
      end

      it "is invalid without a password" do
        user = User.create(name: "John Smith", email: "sample@sample.com", password_digest_confirmation: "1234567")

        expect(user).to be_invalid
      end

      it "is invalid without a password confirmation" do
        user = User.create(name: "John Smith", email: "sample@sample.com", password_digest: "1234567")

        expect(user).to be_invalid
      end

      it "is invalid when a password does not equal a password confirmation" do
        user = User.create(name: "John Smith", email: "sample@sample.com", password_digest: "1234567", password_digest_confirmation: "7654321")

        expect(user).to be_invalid
      end

      it "is invalid without a unique email address" do
        user_1 = User.create(name: "John Smith", email: "sample3@sample.com", password_digest: "1234567", password_digest_confirmation: "1234567")
        user_2 = User.create(name: "John Smith", email: "sample3@sample.com", password_digest: "1234567", password_digest_confirmation: "1234567")

        expect(user_1).to be_valid
        expect(user_2).to be_invalid
      end

      it "is invalid when a password is less than 6 characters" do
        user = User.create(name: "John Smith", email: "sample@sample.com", password_digest: "12345", password_digest_confirmation: "12345")

        expect(user).to be_invalid
      end
    end

    context "valid attributes when creating a user" do
      it "is valid with all attributes" do
        user = User.create(name: "John Smith", email: "sample2@sample.com", password_digest: "1234567", password_digest_confirmation: "1234567")

        expect(user).to be_valid
      end
    end
  end
end
