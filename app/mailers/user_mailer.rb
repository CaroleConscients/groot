class UserMailer < ApplicationMailer

  def certificate(user_id)
    @user = User.find(user_id)
    # Update congratulation so the modal is not triggered anymore
    @user.update(congratulation: false)
    mail.attachments['parcel.klm'] = File.join("#{Rails.root}app/assets/images/parcel.klm")
    mail(to: @user.email, subject: 'Your certificate')
     # This will render a view in `app/views/user_mailer`!
  end
  
end
