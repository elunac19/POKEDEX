class PokemonsController < ApplicationController
    def index
        @pokemon_list = Pokemon.all
        @current_pokemon_index = params[:index].to_i || 0
      
        if params[:tipo].present?
            session[:filtered_tipo] = params[:tipo]
        elsif params[:clear_filter].present?
            session[:filtered_tipo] = nil
        end
      
        if session[:filtered_tipo].present?
            @pokemon_list = @pokemon_list.where(tipo: session[:filtered_tipo])
        end

        @current_pokemon_index = @current_pokemon_index % @pokemon_list.length
        @current_pokemon_index += @pokemon_list.length if @current_pokemon_index.negative?
      
        @pokemon = @pokemon_list[@current_pokemon_index]
    end
    
    def next
        current_index = params[:index].to_i || 0
        next_index = (current_index + 1) % Pokemon.count
        redirect_to pokemons_path(index: next_index)
    end
    
    def prev
        current_index = params[:index].to_i || 0
        prev_index = (current_index - 1) % Pokemon.count
        redirect_to pokemons_path(index: prev_index)
    end  
end

#Correr en consola

# (1..820).each do |pokemon_id|
#   pokemon_data = PokeApi.get(pokemon: pokemon_id)
#   Pokemon.create(
#     name: pokemon_data.name,
#     image: pokemon_data.sprites.front_shiny,
#     height: pokemon_data.height / 10.0,  
#     weight: pokemon_data.weight / 10.0,  
#     tipo: pokemon_data.types.first.type.name,
#     hp: pokemon_data.stats.find { |stat| stat.stat.name == 'hp' }.base_stat,
#     attack: pokemon_data.stats.find { |stat| stat.stat.name == 'attack' }.base_stat,
#     defense: pokemon_data.stats.find { |stat| stat.stat.name == 'defense' }.base_stat,
#     special_attack: pokemon_data.stats.find { |stat| stat.stat.name == 'special-attack' }.base_stat,
#     special_defense: pokemon_data.stats.find { |stat| stat.stat.name == 'special-defense' }.base_stat,
#     velocity: pokemon_data.stats.find { |stat| stat.stat.name == 'speed' }.base_stat
#   )
# end