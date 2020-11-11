class Api

    #make calls to our api

    #attr_accessor :query

    # def initialize(user_region)
    #     @user_region = user_region
    # end

    def self.fetch_houses
        url = "https://www.anapioficeandfire.com/api/houses?pageSize=70&region=the%20north&hasSeats=true&hasWords=true"
        uri = URI(url)
        response = Net::HTTP.get(uri) # error in terminal on this line
        hash = JSON.parse(response)
    end

    def self.create_houses
        self.fetch_houses.each do |house| # error in terminal on this line
            House.new(house["name"], house["region"], house["words"], house["seats"], house["coatOfArms"], house["ancestralWeapons"])
        end
    end
#binding.pry
end


puts "api"

