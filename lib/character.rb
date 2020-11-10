require_relative '../environment.rb'

class Character

    attr_accessor :name, :gender, :culture, :aliases, :allegiances

    @@all = []

    def initialize(name, gender, culture, aliases, allegiances)
        @name = name
        @gender = gender
        @culture = culture
        @aliases = aliases
        @allegiances = allegiances
        @@all << self
    end

    def self.all
        @@all
    end

    def self.display_characters
        puts "Please choose one of the following characters"



end 