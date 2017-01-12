class UserMailer < ApplicationMailer

  def thank_you_email(user)
    @user = user
    @url = 'https://serene-beyond-86450.herokuapp.com/'
    mail(to:@user.email, subject: 'Thank you for your purchase!')
  end
end
