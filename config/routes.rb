Rails.application.routes.draw do
  # devise_for :users
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  root to: "homes#index"
  get 'embed/scripplets', to: 'embed#scripplets'
  post 'homes/register', to: 'homes#register'
  resources :embed
  resources :scribblets
  resources :tags
  resources :sites
end
