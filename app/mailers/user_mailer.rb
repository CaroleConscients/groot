class UserMailer < ApplicationMailer

  # Sending email to User with his certificate and klm
  def email_certificate(user_id)
    @user = User.find(user_id)
    @tree_id = @user.card.tree_id

    # Update congratulation so the modal is not triggered anymore
    @user.update(congratulation: false)

    # Pdf from url
    pdf = WickedPdf.new.pdf_from_url("#{ENV["PDF_URL"]}#{user_id}")
    mail.attachments['certificate.pdf'] = pdf

    # Attach parcel.klm
    if User.count < 1218
      mail.attachments['Parcel.kml'] = File.read("#{Rails.root}/app/assets/images/Parcel_1.kml")
    else
      mail.attachments['Parcel.kml'] = File.read("#{Rails.root}/app/assets/images/Parcel_2.kml")
    end

    # This will render a view in `app/views/user_mailer`!
    mail(to: @user.email, subject: "Plantez un groot – Votre certificat #{@tree_id}")
  end
end
