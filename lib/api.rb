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
        #response_body = response.body
        # => "[{\"url\":\"https://www.anapioficeandfire.com/api/houses/1\",\"name\":\"House Algood\",
        hash_house = JSON.parse(response) # or response_body ?
        # => [{"url"=>"https://www.anapioficeandfire.com/api/houses/1", "name"=>"House Algood", 
        # @array_of_houses = hash[""]
    end

    def self.create_houses # @array_of_houses.each
        self.fetch_houses.each {|house| House.new(house["name"], house["region"], house["words"], house["coatOfArms"], house["founded"], house["diedOut"], house["ancestralWeapons"]) } # = var
        #puts var
    end
    # https://youtu.be/_Au8iv6ZIkY?t=3062
    # send method? Iterate over hash and use metaprogramming?
end

puts "anything"
# house_instance = House.new(name: house["name"])
# house_instance.region = house["region"]
# house_instance.words = house["words"]
# house_instance.coat = house["coatOfArms"]
# house_instance.founded = house["founded"]
# house_instance.diedout = house["diedOut"]
# house_instance.weapons = house["ancestralWeapons"]



# api = Api.new("characters")
# binding.pry
# "Let us pry."