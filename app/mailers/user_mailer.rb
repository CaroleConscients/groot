class UserMailer < ApplicationMailer

  def certificate(user)
    @user = user  # Instance variable => available in view
    mail(to: @user.email, subject: 'Your certificate')
     # This will render a view in `app/views/user_mailer`!
  end
end
