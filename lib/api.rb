class Api

    attr_accessor :query

    def initialize(query)
        @query = query
    end

    def fetch_houses
        url = "https://www.anapioficeandfire.com/api/houses?pageSize=70&region=#{query}&hasWords=true"
        uri = URI(url)
        response = Net::HTTP.get(uri) 
        JSON.parse(response) 
    end

    def create_houses
        self.fetch_houses.each do |house|
            House.new(house["name"], house["region"], house["words"], house["titles"], house["seats"], house["coatOfArms"], house["ancestralWeapons"])
        end
    end

end