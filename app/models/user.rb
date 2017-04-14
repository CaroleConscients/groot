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
    # reset last_turned card to false
    reset_last_turned
    unless card.nil?
      user_count = User.count
      # generate the tree_id with prefix
      tree_id = generate_tree_id(user_count)
      card.update(turned: true, last_turned: true, tree_id: tree_id, user: self)
      self.update(tree_count: user_count, congratulation: true)
      UserMailer.email_certificate(self.id).deliver_later(wait: 2.seconds)
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

  private

  def reset_last_turned
    last_turned_card = Card.where(last_turned: true)
    unless last_turned_card.nil?
      last_turned_card.update(last_turned: false)
    end
  end

  # generate the tree_id number for certificate
  def generate_tree_id(count)
    if count < 10
      "000#{count}"
    elsif count >= 10 && count < 100
      "00#{count}"
    elsif count >= 100 && count < 1000
      "0#{count}"
    else
      "#{count}" 
    end
  end
end



