class Api

    # make calls to our api

    def self.fetch_houses
        url = "https://www.anapioficeandfire.com/api/houses?pageSize=70&region=the%20north&hasSeats=true&hasWords=true"
        uri = URI(url)
        response = Net::HTTP.get(uri) 
        house_array = JSON.parse(response) # takes string and makes hash
        house_array.each do |house| # initialize a new house and assign attributes to it
            house_instance = House.new(house["name"], house["region"], house["words"], house["titles"], house["seats"], house["coatOfArms"], house["ancestralWeapons"])
        end
    end

end





#attr_accessor :query

# def initialize(query)
#     @query = query
# end


