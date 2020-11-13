class House

    attr_accessor :name, :region, :words, :titles, :seats, :coatOfArms, :ancestralWeapons

    @@all = []

    def initialize(name, region, words, titles, seats, coatOfArms, ancestralWeapons)
        @name = name
        @region = region
        @words = words
        @titles = titles
        @seats = seats
        @coatOfArms = coatOfArms
        @ancestralWeapons = ancestralWeapons
        @@all << self
    end

    def self.all
        @@all
    end
    
    def self.clear_all
        @@all = []
    end

end


