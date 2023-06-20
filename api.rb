require 'httparty'

#-------------------------API1-------------------------

random = rand(1..150)

response1 = HTTParty.get("https://pokeapi.co/api/v2/pokemon/#{random}")             #https://pokeapi.co/api/v2/pokemon/1

id = response1['id']                                            #imprime solo el id
name = response1['forms'] [0]['name']                           #imprime el solo el nombre del pokemon
ability = response1['abilities'] [0]['ability']['name']         #imprime solo la habilidad del pokemon
puts "API 1 \nId: #{id} \nName:  #{name}  \nAbility: #{ability}"



#-------------------------API2-------------------------
response2 = HTTParty.get('https://jsonplaceholder.typicode.com/posts/1')    #https://jsonplaceholder.typicode.com
                                                                            #Realizar post http://httpbin.org

#puts response2.body                                    #imprime todo el body

title = response2['title']                             #imprime solo el titulo
puts "\n\nAPI 2 \nThe title of the post is: #{title}"