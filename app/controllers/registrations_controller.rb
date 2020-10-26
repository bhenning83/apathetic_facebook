class RegistrationsController < Devise::RegistrationsController
  def create
    super
    if @user.persisted?
       begin
      UserMailer.with(user: @user).welcome_email.deliver_now #unless Rails.env.production?
    rescue
      flash.notice = "Successfully signed up. (Welcome email not sent)"
    end
    end
  end
  
  private

  def sign_up_params
    params.require(:user).permit(:email, :password, :name)
  end
end