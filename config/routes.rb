Rails.application.routes.draw do

  # Only Admin users can access the sidekiq dashboard
  require "sidekiq/web"
  authenticate :user, lambda { |u| u.admin } do
    mount Sidekiq::Web => '/sidekiq'
  end

  devise_for :users,
  controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  # Homepage
  root to: 'pages#home'

  # Certificate in html to convert to pdf
  get 'certificate/user/:id', to: 'pages#certificate'
  # Download pdf link
  get :download_certificate, to: 'pages#download_certificate'

  # Required by twitter api
  get 'privacy', to: 'pages#privacy'
  get 'terms', to: 'pages#terms'

  # Page with forest map
  # get 'foret-groot', to: 'pages#forest'

  # Stress test
  # get 'loaderio-51b2f97f3c21b82ca26cc5f95eebf17d', to: 'pages#stress_test' 

end
