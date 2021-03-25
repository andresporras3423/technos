class PokemonController < ApplicationController
    def get
        pokemon_file_path = File.join(File.dirname(__FILE__), "../texts/pokemons.txt") 
        file = File.open(pokemon_file_path)
        file_data = file.read
        file.close
        render json: file_data, status: :ok
      end

      def get_names_types
        pokemon_file_path = File.join(File.dirname(__FILE__), "../texts/pokemons.txt") 
        file = File.open(pokemon_file_path)
        file_data = file.read
        file.close
        ruby_output = Hash.new
        ruby_obj = JSON.parse(file_data)
        ruby_obj.each do |key, value| 
          ruby_output[key] = Hash.new
          ruby_output[key]['name']=value['name']
          ruby_output[key]['types']=value['types']
        end
        render json: ruby_output, status: :ok
      end

      def get_details
        pokemon_file_path = File.join(File.dirname(__FILE__), "../texts/pokemons.txt") 
        file = File.open(pokemon_file_path)
        file_data = file.read
        file.close
        ruby_output = Hash.new
        ruby_obj = JSON.parse(file_data)
        ruby_obj.each do |key, value|
          if key==params[:id].to_s
            ruby_output=value 
            break
          end
        end
        render json: ruby_output, status: :ok
      end
end
