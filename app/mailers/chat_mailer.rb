class ChatMailer < ApplicationMailer
  def email user
    @user = user

    mail to: user.email, subject: 'New message'
  end
end
