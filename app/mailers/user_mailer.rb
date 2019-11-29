class UserMailer < ApplicationMailer
  default from: 'kostyknazar23@gmail.com'

  def send_email
    @text = params[:text]
    @user = params[:user]
    mail(to: @user.email, subject: 'Some cool info')
  end
end
