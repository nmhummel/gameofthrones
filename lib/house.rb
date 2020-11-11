require_relative '../environment.rb'

# ARTICLE - Nick

class House

    attr_accessor :name, :region, :words, :seats, :coatOfArms, :ancestralWeapons

    @@all = []

    def initialize(name, region, words, seats, coatOfArms, ancestralWeapons)
        @name = name
        @region = region
        @words = words
        @seats = seats
        @coatOfArms = coatOfArms
        @ancestralWeapons = ancestralWeapons
        @@all << self
    end

    def self.all
        @@all
    end

    def self.clear
        @@all.clear
    end

    def self.display_houses
        puts "Let's take a look at some of the houses that are held in the highest regard. Please choose by entering the number of the House you wish to explore:"
        self.all.each.with_index(1) do |house, index|
            puts "#{index}. #{house.name}"
        end
    end

    def self.display_house(index)
        house = self.all[index]
        puts "Name: " + house.name
        puts "Region: " + house.region
        puts "Words: " + house.words
        puts "Seats: " + house.seats
        puts "Coat of Arms: " + house.coatOfArms
        puts "Ancestral Weapons: " + house.ancestralWeapons
    end

#binding.pry
end

puts "house"




# require_relative '../environment.rb'

# class Region

#     @@regions = ["Iron Islands", "Dorne", "The Vale", "The Reach", "The Riverlands", "The Crownlands", "The Stormlands", "The Westerlands", "The Neck", "Beyond the Wall"]


#     def self.all
#         @@regions
#     end

#     def self.display_regions  # WORKS - DO NOT TOUCH
#         puts "Please choose one of the following Regions:"
#         self.all.each_with_index{|region, index| puts "#{index + 1}. #{region}"}

#     end

#     def def ask_user_for_region
#         self.all.each {|region| puts "Aww yes, the terrible beauty that is #{region}."}
#         puts "Here are some houses with whom you may want to form an alliance."
#     end


# #binding.pry
# end

# puts "regions"

