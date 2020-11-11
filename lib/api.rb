class Api

    # make calls to our api



    def self.fetch_houses
        url = "https://www.anapioficeandfire.com/api/houses?pageSize=70&region=the%20north&hasSeats=true&hasWords=true"
        uri = URI(url)
        response = Net::HTTP.get(uri) # error in terminal on this line
        house_array = JSON.parse(response) # takes string and makes hash
        house_array.each do |house| # initialize a new house
            house_instance = House.new(house["name"], house["region"], house["words"], house["seats"], house["coatOfArms"], house["ancestralWeapons"])
            # assign attributes to it

        end
    end

end


puts "api"

#house_instance (house["name"], house["region"], house["words"], house["seats"], house["coatOfArms"], house["ancestralWeapons"])

#attr_accessor :query

# def initialize(query)
#     @query = query
# end


# house_instance.name = house["name"]
# house_instance.region = house["region"]
# house_instance.words = house["words"]
# house_instance.seats = house["seats"]
# house_instance.coat = house["coatOfArms"]
# house_instance.weapons = house["ancestralWeapons"] 