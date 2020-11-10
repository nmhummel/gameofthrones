require_relative '../environment.rb'

class House

    attr_accessor :name, :region, :words, :coatOfArms, :ancestralWeapons

    @@houses = []

    def initialize(name, region, words, coatOfArms, ancestralWeapons)
        @name = name
        @region = region
        @words = words
        @coatOfArms = coatOfArms
        @ancestralWeapons = ancestralWeapons
        @@all << self
    end

    def self.all
        @@houses
    end

    def 
        Api.create_houses # @array_of_houses.each
    #     self.fetch_houses.each {|house| House.new(house["name"], house["region"], house["words"], house["coatOfArms"], house["founded"], house["diedOut"], house["ancestralWeapons"]) } # = var
    #     #puts var
    #   #  
    end


    def display_list_of_houses
        Api.new(user_region)
        House.all.each.with_index(1) do |house, index|
            puts "#{index}. #{house.name}"
        end
    end

#binding.pry
end

puts "house"




