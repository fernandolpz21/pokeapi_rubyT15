require 'poke-api-v2'

class PokemonsController < ApplicationController
  def index
    @pokemons = PokeApi.get(pokemon: { limit: 151 }).results
  end
  def show
    @pokemon = PokeApi.get(pokemon: params[:id])
  end
end
