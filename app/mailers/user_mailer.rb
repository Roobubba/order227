class UserMailer < ActionMailer::Base
  default from: "order227band@gmail.com"

  def registration_confirmation(user)
    #Set the @user variable for the mailer views to use
    @user = user
    mail(:to => "#{user.username} <#{user.email}>", :subject => "Confirm sign-up for Order#227 Mailing List")
  end
  
  def password_reset(user)
    @user = user
    mail(:to => "#{user.username} <#{user.email}>", :subject => "Password Reset")
  end  
  
  def welcome_message(user)
    @user = user
    mail(:to => "#{user.username} <#{user.email}>", :subject => "Order#227 Mailing List registration successful")
  end
  
end