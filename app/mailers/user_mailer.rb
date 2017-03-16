class UserMailer < ApplicationMailer

  def certificate(user_id)
    @user = User.find(user_id)
    @tree_id = @user.card.tree_id
    # Update congratulation so the modal is not triggered anymore
    @user.update(congratulation: false)
    # Attach parcel.klm
    mail.attachments['parcel.klm'] = File.join("#{Rails.root}app/assets/images/parcel.klm")
    
    # Attach pdf certificate
    # mail.attachments["certificate_#{@tree_id}.pdf"] = WickedPdf.new.pdf_from_string(
    #   render_to_string(pdf: 'todo', template: 'todo.pdf.erb', layout: 'pdf.html')

    # Pdf from url
    pdf = WickedPdf.new.pdf_from_url("http://localhost:3000/certificate/user/#{user_id}")
    mail.attachments['certificate'] = pdf

    mail(to: @user.email, subject: 'Your certificate')
     # This will render a view in `app/views/user_mailer`!
  end
end
