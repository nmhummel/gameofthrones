class House

    attr_accessor :name, :region, :words, :titles, :seats, :coatOfArms, :ancestralWeapons

    @@all = []

    def initialize(name, region, words, titles, seats, coatOfArms, ancestralWeapons="None on record.")
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
    
    # def empty?
    #     @@all.map do |attribute|
    #         if attribute.ancestralWeapons == "" || attribute.blank?
    #             puts "None on record."
    #         else
    #             attribute
    #         end
    #     end
    # end

end


