Rails.application.routes.draw do
  # devise_for :users
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  root to: "scribblet#index"
  get 'embed/scripplets', to: 'embed#scripplets'
  resources :embed
  resources :tag
  resources :site
end
