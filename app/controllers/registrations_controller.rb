class RegistrationsController < Devise::RegistrationsController
  def create
    super
    if @user.persisted?
      UserMailer.with(user: @user).welcome_email.deliver_now
    end
  end
  
  private

  def sign_up_params
    params.require(:user).permit(:email, :password, :name)
  end
end