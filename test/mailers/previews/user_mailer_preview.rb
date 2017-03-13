class UserMailerPreview < ActionMailer::Preview
  def certificate
    user = User.first
    UserMailer.certificate(user)
  end
end