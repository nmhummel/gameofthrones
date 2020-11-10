require_relative '../environment.rb'
require_relative './house.rb'
class Api

    attr_accessor :page_num, :user_region

    @@user_region = []

    def initialize(user_region)
        #@page_num = page_num
        @user_region = user_region
    end

    def self.fetch_regions
        url = "https://www.anapioficeandfire.com/api/houses?page1&pageSize=10&region=#{@user_region}"
        uri = URI(url)
        response = Net::HTTP.get(uri)
        hash_house = JSON.parse(response)
    end

    def create_regions(user_region)
        self.fetch_regions.each do |region|
            
        #Regions.new(region["Iron Islands", "Dorne", "The Vale", "The Reach", "The Riverlands", "The Crownlands", "The Stormlands", "The Westerlands", "The Neck", "Beyond the Wall"])
        end
    end

end

# api = Api.new("characters")
# binding.pry
# "Let us pry."
# Api.fetch_houses
# Api.create_houses

puts "api"

