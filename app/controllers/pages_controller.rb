class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @cards = Card.order(:id)
  end

  # HTML certificate to convert to pdf
  def certificate
    @user = current_user
  end

  # Required by twitter
  def privacy
  end

  def terms
  end
end
