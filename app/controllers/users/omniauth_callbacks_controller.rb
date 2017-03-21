class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def twitter
    user = User.find_for_twitter_oauth(request.env['omniauth.auth'])

    if user.persisted?
      unless user.congratulation
        flash.notice = "Vous avez déjà planté le groot #{user.card.tree_id}! Bravo vous avez participé à sauver notre galaxie ! "
      end
      sign_in_and_redirect user
    else
      flash.notice = "Votre authentifaction twitter a échoué pour une raison mystérieuse, mais vous pouvez ré-essayer !"
      redirect_to root_path
    end
  end
end
