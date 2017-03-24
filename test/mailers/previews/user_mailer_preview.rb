class UserMailerPreview < ActionMailer::Preview

  # http://localhost:3000/rails/mailers/user_mailer/email_certificate
  def email_certificate
    user = User.first
    UserMailer.email_certificate(user)
  end
end