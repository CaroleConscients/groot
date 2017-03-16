class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :certificate, :privacy, :terms ]

  def home
    @cards = Card.order(:id)
  end

  # HTML certificate to convert to pdf
  # The navbar is escaped in that view cf:layout
  def certificate
    @user = User.find(params[:id])
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "certificate" # Excluding ".pdf" extension.
      end
    end
  end

  # Required by twitter
  def privacy
  end
  
  def terms
  end

end
