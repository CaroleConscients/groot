class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def twitter
    user = User.find_for_twitter_oauth(request.env['omniauth.auth'])

    if user.persisted?
      unless user.card.last_turned
        flash.notice = "Vous avez déjà planté le groot #{user.card.tree_id}!"
      end
      sign_in_and_redirect user
    else
      flash.notice = "Oups, votre authentifaction twitter a échoué."
      redirect_to root_path
    end
  end

end
