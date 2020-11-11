#require_relative '../environment.rb'
require_relative 'house.rb'

class Api

    #attr_accessor :query

    # def initialize(user_region)
    #     @user_region = user_region
    # end

    def self.fetch_houses
        url = "https://www.anapioficeandfire.com/api/houses?pageSize=70&region=the%20north&hasSeats=true&hasWords=true"
        uri = URI(url)
        response = Net::HTTP.get(uri)
        hash_dorne = JSON.parse(response)
    end

    def self.create_houses
        self.fetch_houses.each do |house|
            House.new(house["name"], house["region"], house["words"], house["seats"], house["coatOfArms"], house["ancestralWeapons"])
        end
    end
#binding.pry
end


puts "api"

