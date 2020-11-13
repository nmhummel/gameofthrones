class Api

    attr_accessor :query

    def initialize(query)
        @query = query
    end

    def self.fetch_houses
        url = "https://www.anapioficeandfire.com/api/houses?pageSize=70&region=#{query}&hasSeats=true&hasWords=true"
        uri = URI(url)
        response = Net::HTTP.get(uri) 
        house_array = JSON.parse(response) 
        house_array.each do |house|
            House.new(house["name"], house["region"], house["words"], house["titles"], house["seats"], house["coatOfArms"], house["ancestralWeapons"])
        end
    end

end

#     url = "https://www.anapioficeandfire.com/api/houses?pageSize=70&region=the%20north&hasSeats=true&hasWords=true"