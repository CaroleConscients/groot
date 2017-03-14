class UserMailer < ApplicationMailer

  def certificate(user)
    # INCLUDE HERE THE RESET OF USER BOOLEAN THAT TRIGGERS CONGRAT MODAL
    @user = user  # Instance variable => available in view of the mail
    mail.attachments['parcel.klm'] = File.join("#{Rails.root}app/assets/images/parcel.klm")
    mail(to: @user.email, subject: 'Your certificate')
     # This will render a view in `app/views/user_mailer`!
  end
  
end
