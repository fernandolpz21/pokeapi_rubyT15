Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "pokemons#index"

  get "/pokemons", to: "pokemons#index"
  get "/pokemons/:id", to: "pokemons#show"
end
