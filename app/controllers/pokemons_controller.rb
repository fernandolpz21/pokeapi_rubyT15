require 'poke-api-v2'

class PokemonsController < ApplicationController
  def index
    fetch_pokemons_from_api
    @pokemons = Pokemon.all
  end
  def show
    @pokemon = Pokemon.find(params[:id])
  end
  private
  def fetch_pokemons_from_api
    response = PokeApi.get(pokemon: { limit: 151 }) # Fetching the first 151 original Pokemons
    pokemons = []

    response.results.each do |pokemon_entry|

       unless Pokemon.exists?(name: pokemon_entry.name)
      pokemon_data = PokeApi.get(pokemon: pokemon_entry.name)
        
      pokemon = Pokemon.new(
        name: pokemon_data.name,
        height: pokemon_data.height,
        weight: pokemon_data.weight,
        types: pokemon_data.types.map { |type| type.type.name }.join(', '),
        abilities: pokemon_data.abilities.map { |ability| ability.ability.name }.join(', '),
        sprite: pokemon_data.sprites.front_default
      )
      pokemon.save
       end

      
    end

  end
end
