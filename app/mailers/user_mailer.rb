# app/mailers/user_mailer.rb
class UserMailer < ApplicationMailer
  default from: 'hehe@example.com' # This can be anything

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to HASH')
  end
end
