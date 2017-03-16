class UserMailer < ApplicationMailer

  # Sending email to User with his certificate and klm
  def certificate(user_id)
    @user = User.find(user_id)
    @tree_id = @user.card.tree_id

    # Update congratulation so the modal is not triggered anymore
    @user.update(congratulation: false)

    # Pdf from url
    pdf = WickedPdf.new.pdf_from_url("http://localhost:3000/certificate/user/#{user_id}")
    mail.attachments['certificate.pdf'] = pdf

    # Attach parcel.klm
    mail.attachments['parcel.kml'] = File.join("#{Rails.root}/app/assets/images/parcel.klm")
    
    # This will render a view in `app/views/user_mailer`!
    mail(to: @user.email, subject: "Certificate_#{@user.card.tree_id}")
  end
end
