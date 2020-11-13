class Cli

    @@got_regions = ["Iron Islands", "Dorne", "The Vale", "The Reach", "The Riverlands", "The Crownlands", "The Stormlands", "The Westerlands", "The Neck", "Beyond the Wall"]
    # CCCCC
    @@saved_houses = []

    def start
        puts "WELCOME TO WESTEROS" 
        puts "\n" 
        puts "If you're going to play the GoT, you need to know the teams."
        sleep(1)
        puts "Tell me-- which of the below regions are you interested in laying down roots? (enter number 1-10)"
        self.display_regions # display regions - AAAAA  -  ex. 2. Dorne
        index = self.regions_input # user inputs - BBBBB  -  ex. index = 2

        #query = @@got_regions[index] # checks validity - CCCCC - ex. query = Dorne

        api = Api.new(query) # Api.rb new instance/query
        api.create_houses
        display_houses # DDDDD
        #self.menu
    end

    def self.got_regions
        @@got_regions
    end

    def display_regions # AAAAA
        @@got_regions.each_with_index {|region, index| puts "#{index + 1}. #{region}"}
    end

    def regions_input # BBBBB
        input = gets.strip 
        number = selection_to_index(input) # DDDDD  
        until number.between?(0,9)
            sleep(1)
            puts "Please select a valid number."
            self.regions_input # BBBBB
        end
    end

    def selection_to_index(input) # DDDDD
        input.to_i - 1
    end  
    
    def display_houses   # EEEEE
        puts "Would you like to meet some potential allies from there? (type yes or no)"
        user_input = gets.strip.downcase 
        if user_input == "yes"  
            puts "\n" 
            puts "Wise decision."
            puts "\n" 
            puts "Let's take a look at some of the houses that are held in the highest regard."
            puts "Please choose by entering the number of the House you wish to explore:"
            puts "\n" 
            display_list_of_houses # FFFFF
            ask_user_for_house_choice # GGGGG
            display_houses # EEEEE
        elsif          
            user_input == "no"
            exit_program # HHHHH
        else 
            sleep(1)
            puts "Please select a valid choice."
            display_houses # EEEEE
        end
    end   
 
    def display_list_of_houses # FFFFF
        House.all.each.with_index(1) {|house, index| puts "#{index}. #{house.name}"}
        puts "\n" 
    end
         
   def ask_user_for_house_choice # GGGGG
        house_input = gets.strip
        number = selection_to_index(house_input) # DDDDD
        until house_input.between?(0,max) 
            sleep(1)
            puts "Please select a valid number."
            house_input = gets.strip.to_i - 1
        end
        house_instance = House.all[house_input]
        display_house_details(house_instance) # IIIII
        save_chosen_house(house_instance) # JJJJJ
    end

    def display_house_details(house) # IIIII
        puts "\n" 
        puts "Name: " + house.name 
        puts "Region: " + house.region
        print "Words: " 
        puts house.words[0].to_s == "" ? "None on record." : house.words
        print "Titles: " 
        puts house.titles[0] == "" ? "None on record." : house.titles.join(", ")
        puts "Seats: " + house.seats.join(", ")
        puts "Coat of Arms: " + house.coatOfArms
        print "Ancestral Weapons: "
        puts house.ancestralWeapons[0] == "" ? "None on record." : house.ancestralWeapons.join(", ")
    end

    def save_chosen_house(house) #JJJJJ
        puts "\n" 
        puts "Do you think you could be allies? (type yes or no)"
        puts "\n" 
        input = gets.strip.downcase
        if input == "yes"
            @@saved_houses << house.name.to_s   
            puts "\n" 
            puts "Excellent. I have saved this choice for you in your journal."
            puts "\n" 
        elsif input == "no"
            @@saved_houses.delete(house.name)
            puts "\n" 
            puts "Very well. Let's find you another House."
            puts "\n" 
            menu
        else 
            puts "Please select a valid number."
            input = gets.strip.downcase
        end
    end

    def exit_program # HHHHH
        if @@saved_houses.empty?
            puts "\n" 
            puts "Farewell, then. With no allies, I expect you'll be dead in less than a fortnight."
            exit
        else 
            puts "You have chosen the following houses as your allies:"
            sleep(1)
            puts @@saved_houses.uniq
            puts "\n" 
            sleep(1)
            puts "Now go forth and introduce yourself. Good luck!"
            exit
        end
        return
    end

    # def self.clear # was on house.rb
    #     @@saved_houses.clear
    # end

#binding.pry
end
    


    # def self.all
    #     @@regions
    # end

 
