require_relative '../environment.rb'

class Api

    #attr_accessor :query

    # def initialize(query)
    #     @query = query
    # end

    def self.fetch_houses
        url = "https://www.anapioficeandfire.com/api/houses"
        uri = URI(url)
        response = Net::HTTP.get(uri)
        hash_house = JSON.parse(response)
    end

    def self.create_houses
        stuff = self.fetch_houses.each {|house| House.new(house["name"], house["region"], house["words"], house["coatOfArms"], house["founded"], house["diedOut"], house["ancestralWeapons"]) }
        puts stuff
    end
binding.pry
end

puts "anything"
# house_instance = House.new(name: house["name"])
# house_instance.region = house["region"]
# house_instance.words = house["words"]
# house_instance.coat = house["coatOfArms"]
# house_instance.founded = house["founded"]
# house_instance.diedout = house["diedOut"]
# house_instance.weapons = house["ancestralWeapons"]

# def fetch_books
#     url = "https://www.anapioficeandfire.com/api/books"
#     uri = URI(url)
#     response = Net::HTTP.get(uri)
#     books = JSON.parse(response)
#     sorted_books = books.each do |book| 
#         self.new(book["name"], book["numberOfPages"], book["characters"], book["released"])
#     end
    
# end

# def fetch_characters
#     url = "https://www.anapioficeandfire.com/api/characters"
#     uri = URI(url)
#     response = Net::HTTP.get(uri)
#     characters = JSON.parse(response)
#     sorted_characters = characters.each do |character| 
#         self.new(character["name"], character["gender"], character["culture"], character["aliases"], character["allegiances"])
#     end
# end

# api = Api.new("characters")
# binding.pry
# "Let us pry."