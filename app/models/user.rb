class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:twitter]

  has_one :card

  after_create :unlock_a_card

  def unlock_a_card
    card = Card.where(turned: false).order("RANDOM()").first
    reset_turned
    unless card.nil?
      card.turned = true
      card.last_turned = true
      card.tree_id = User.count
      card.user = self
      card.save
      UserMailer.certificate(self).deliver_now
    else
      flash.notice = "Tous les groots ont été plantés ! Rdv dans les salles le 28 avril."
    end
  end

  def self.find_for_twitter_oauth(auth)
    user_params = auth.slice(:provider, :uid)
    user_params.merge! auth.info.slice(:email, :name, :nickname)
    user_params = user_params.to_h

    user = User.where(provider: auth.provider, uid: auth.uid).first
    user ||= User.where(email: auth.info.email).first # User did a regular sign up in the past.
    if user
      user.update(user_params)
    else
      user = User.new(user_params)
      user.password = Devise.friendly_token[0,20]  # Fake password for validation
      user.save
    end
    return user
  end

  def reset_turned
    last_turned_card = Card.where(last_turned: true)
    unless last_turned_card.nil?
      last_turned_card.update(last_turned: false)
    end
  end
end



