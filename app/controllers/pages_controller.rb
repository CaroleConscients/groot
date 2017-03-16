class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :certificate, :privacy, :terms ]

  def home
    @cards = Card.order(:id)
  end

  # HTML certificate to convert to pdf
  # The navbar is escaped in that view cf:layout
  def certificate
    @user = User.find(params[:id])
  end

  def download_certificate
    @user = current_user
    pdf = WickedPdf.new.pdf_from_url("#{ENV["PDF_URL"]}#{@user.id}")
    send_data pdf, filename: "certificate_#{@user.card.tree_id}.pdf", type: "application/pdf", disposition: "attachment"
  end

  # Required by twitter
  def privacy
  end
  
  def terms
  end

end
