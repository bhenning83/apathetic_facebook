class UserMailer < ApplicationMailer

  def welcome_email
    @user = params[:user]
    mail(to: @user.email, subject: 'You are signed up for Apathetic Facebook, so...')
  end
end
