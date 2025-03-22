class UserMailer < ApplicationMailer
  default from: ENV["USER_NAME"]

  def welcome_email(user)
    @user = user
    @url = "http://localhost:3000/users/sign_in"
    mail(to: @user.email, subject: "Welcome to Social Media Clone")
  end
end
