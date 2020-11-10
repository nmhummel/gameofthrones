require_relative '../environment.rb'

class Region

    @@regions = ["Iron Islands", "Dorne", "The Vale", "The Reach", "The Riverlands", "The Crownlands", "The Stormlands", "The Westerlands", "The Neck", "Beyond the Wall"]


    def self.all
        @@regions
    end

    def self.display_regions  # WORKS - DO NOT TOUCH
        puts "Please choose one of the following Regions:"
        self.all.each_with_index{|region, index| puts "#{index + 1}. #{region}"}
    end

    def def ask_user_for_region
        Api.new(page_num, user_region)
    end


#binding.pry
end

puts "regions"

