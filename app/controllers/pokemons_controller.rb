require 'poke-api-v2'

class PokemonsController < ApplicationController
  def index
    @pokemons = PokeApi.get(pokemon: { limit: 151 }).results
    @pokemon_sprites = @pokemons.map do |pokemon|
      pokemon_data = PokeApi.get(pokemon: pokemon.name)
      pokemon_data.sprites.front_default
    end
  end
  def show
    @pokemon = PokeApi.get(pokemon: params[:id])
  end
end
