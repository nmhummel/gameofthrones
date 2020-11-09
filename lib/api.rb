require 'pry'
require_relative '../environment.rb'

class Api

    attr_accessor :query
    

    def initialize(query)
        @query = query
    end

    def fetch_books
        url = "https://www.anapioficeandfire.com/api/books"
        uri = URI(url)
        response = Net::HTTP.get(uri)
        books = JSON.parse(response)
    end

    def fetch_characters
        url = "https://www.anapioficeandfire.com/api/characters"
        uri = URI(url)
        response = Net::HTTP.get(uri)
        characters = JSON.parse(response)
    end

    def fetch_houses
        url = "https://www.anapioficeandfire.com/api/houses"
        uri = URI(url)
        response = Net::HTTP.get(uri)
        houses = JSON.parse(response)
    end

end

# api = Api.new("characters")
# binding.pry
# "Let us pry."