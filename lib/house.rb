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
    
    # def self.display_characters
    #     puts "Please choose one of the following characters"
    # end

end






