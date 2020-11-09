
class Players

    attr_accessor :name, :gender, :culture, :aliases, :allegiances

    def initialize(name, gender, culture, aliases, allegiances)
        @name = name
        @gender = gender
        @culture = culture
        @aliases = aliases
        @allegiances = allegiances
    end


end