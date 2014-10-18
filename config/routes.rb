Rails.application.routes.draw do
  # devise_for :users
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  root to: "scribblets#index"
  get 'embed/scripplets', to: 'embed#scripplets'
  resources :scribblets
  resources :embeds
  resources :tags
  resources :sites
end
