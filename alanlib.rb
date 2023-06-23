require 'httparty'

class Lib
  POKEMON_URL = "https://pokeapi.co/"                 
  JSON_URL = "https://jsonplaceholder.typicode.com/"

    def initialize(name_api, id)
      @name_api = name_api
      @id = id
    end
  
    def get_data
      case @name_api
        when "pokemon"
            pokemon
        when "json"
            json
        else 
            puts "API not exist"
      end
    end

    def pokemon
        response = api_get(POKEMON_URL, "api/v2/pokemon/")
        puts Presenter.new(response).render
    end

    def json
        response = api_get(JSON_URL, "posts/")
        puts Presenter.new(response).render
    end

    def api_get (url_api, end_point)
      HTTParty.get(url_api + end_point + "#{@id}")
    end

  end

class Presenter 
  
  def initialize(presenter_api)
    @presenter_api = presenter_api
  end

  def render
    api_data = @presenter_api.parsed_response

    if api_data.key?('forms')
      render_pokemon
    elsif api_data.key?('userId')
      render_json
    end

  end

  def render_pokemon
    id = @presenter_api['id']                                            
    name = @presenter_api['forms']&.dig(0, 'name')
    abilities = @presenter_api['abilities']&.map { |ability| ability.dig('ability', 'name') } || []
    "Id: #{id} \nName:  #{name} \nAbilities: " + abilities.join(', ')
  end

  def render_json
    "\n#{@presenter_api.body}\n\n"
  end

end