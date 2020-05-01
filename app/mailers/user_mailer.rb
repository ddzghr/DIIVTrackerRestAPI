class UserMailer < ApplicationMailer
  def confirm_email
    @user = params[:user]
    @url  = confirm_user_url(uuid: @user.uuid,  user_token: @user.confirm_token)
    mail(to: @user.email, subject: 'Welcome to DIIVTracker')
  end

  def send_reset_request
    @user = params[:user]
    @url  = reset_user_url(uuid: @user.uuid,  user_token: @user.password_reset_token)
    mail(to: @user.email, subject: 'Password reset request')
  end

  def send_credentials
    @user = params[:user]
    mail(to: @user.email, subject: 'New credentials for DIIVTracker')
  end
end
