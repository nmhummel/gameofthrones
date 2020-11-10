require_relative '../environment.rb'

class Book

    attr_accessor :name, :numberOfPages, :characters, :released

    def initialize(name, numberOfPages, characters, released)
        @name = name
        @numberOfPages = numberOfPages
        @characters = characters
        @released = released
    end

    
    # def self.create_books
    #     Api.fetch_books.each do |book| 
    #         self.new(book["name"], book["numberOfPages"], book["characters"], book["released"])
    #     end
    # end

end