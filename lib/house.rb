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


    

#binding.pry
end

puts "house"


