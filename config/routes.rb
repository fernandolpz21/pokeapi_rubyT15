# Rails.application.routes.draw do

#   root 'pokemons#index'
#   resources :pokemons, only: [:index, :show]
# end



Rails.application.routes.draw do
  root "static_pages#home"

  post "signup", to: "users#create"
  get "signup", to: "users#new"

  post "login", to: "sessions#create"
  get "login", to: "sessions#new"
  delete "logout", to: "sessions#destroy"

  resources :confirmations, only: [:create, :edit, :new], param: :confirmation_token
  resources :passwords, only: [:create, :edit, :new, :update], param: :password_reset_token

  resources :pokemons, only: [:index, :show]
end
