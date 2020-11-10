require_relative '../environment.rb'
#require_relative 'house.rb'

class Api

    attr_accessor :user_region

    def initialize(user_region)
        @user_region = user_region
    end

    def self.fetch_houses
        url = "https://www.anapioficeandfire.com/api/houses?page1&pageSize=10&region=#{@user_region}"
        uri = URI(url)
        response = Net::HTTP.get(uri)
        hash_house = JSON.parse(response)
    end

    def self.create_houses(user_region)
        self.fetch_houses.each do |house|
            House.new(house["name"], house["region"], house["words"], house["coatOfArms"], house["ancestralWeapons"])
        end
    end
#binding.pry
end


puts "api"

