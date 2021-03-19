class PokemonController < ApplicationController
    def get
        pokemon_file_path = File.join(File.dirname(__FILE__), "../texts/pokemons.txt") 
        file = File.open(pokemon_file_path)
        file_data = file.read
        file.close
        render json: file_data, status: :ok
      end
end
