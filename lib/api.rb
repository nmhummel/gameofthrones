
class Api


    

    def initialize(query)
        @query = query
    end

    def self.fetch_info(query)
        url = "https://www.anapioficeandfire.com/api/#{self.query}"
        uri = URI(url)
        players = Net::HTTP.get(url)


    end

end