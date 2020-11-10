require_relative '../environment.rb'

class House

    attr_accessor :name, :region, :words, :coatOfArms, :founded, :diedOut, :ancestralWeapons

    @@all = []

    def initialize(name, region, words, coatOfArms, founded, diedOut, ancestralWeapons)
        @name = name
        @region = region
        @words = words
        @coatOfArms = coatOfArms
        @founded = founded
        @diedOut = diedOut
        @ancestralWeapons = ancestralWeapons
        @@all << self
    end

    def self.all
        @@all
    end

    # def Api.create_houses # @array_of_houses.each
    #     self.fetch_houses.each {|house| House.new(house["name"], house["region"], house["words"], house["coatOfArms"], house["founded"], house["diedOut"], house["ancestralWeapons"]) } # = var
    #     #puts var
    #   #  binding.pry
    # end

end

puts "house"




