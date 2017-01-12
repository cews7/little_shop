require "rails_helper"

describe UserMailer, type: :mailer do
  let(:user) {User.create!(name: "Jason Conrad", email: "jason@conrad.com", password: "1234567", password_confirmation: "1234567")}
  let(:mail) {described_class.thank_you_email(user).deliver_now!}

  it "renders the subject" do
    expect(mail.subject).to eq('Thank you for your purchase!')
  end

  it "renders the reciever eamil" do
    expect(mail.to).to eq([user.email])
  end

  it "renders the customers name" do
    expect(mail.body.encoded).to match(user.name)
  end

  it "assigns stores website" do
    expect(mail.body.encoded).to match("https://serene-beyond-86450.herokuapp.com/")
  end
end
