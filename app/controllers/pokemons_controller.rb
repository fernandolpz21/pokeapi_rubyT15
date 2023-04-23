require 'poke-api-v2'

class PokemonsController < ApplicationController
  def index
    pokemon = params[:pokemon]
    @pokemons = PokeApi.get(pokemon: { limit: 151 }).results
    #@pokemon = JSON.parse(response.body, symbolize_names: true)
  end
  def show
    @pokemon = PokeApi.get(pokemon: params[:id])
  end
end
