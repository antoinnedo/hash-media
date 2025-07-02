# app/mailers/user_mailer.rb
class UserMailer < ApplicationMailer
  default from: 'notifications@example.com' # This can be anything

  def welcome_email
    mail(to: 'test_recipient@example.com', subject: 'Welcome to My Awesome Site')
  end
end
