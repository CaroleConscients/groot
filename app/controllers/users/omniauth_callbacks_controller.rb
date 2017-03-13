class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def twitter
    user = User.find_for_twitter_oauth(request.env['omniauth.auth'])

    if user.persisted?
      flash.notice = "Vous avez planté le groot #{user.card.tree_id}! "
      sign_in_and_redirect user
    else
      flash.notice = "Oups, votre authentifaction twitter a échoué."
      redirect_to root_path
    end
  end

end
