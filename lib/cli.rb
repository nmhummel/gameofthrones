class Cli

    @@all = []

    def start
        puts "A WELCOME GUIDE TO THE NORTH"   
        Api.fetch_houses
        self.menu
    end

    def menu
        puts "\n" 
        puts "Would you like to meet some potential allies? (type yes or no)"
        user_input = gets.strip.downcase 
        if user_input == "yes"  
            puts "\n" 
            puts "Wise decision."
            puts "\n" 
            puts "Let's take a look at some of the houses that are held in the highest regard."
            puts "Please choose by entering the number of the House you wish to explore:"
            puts "\n" 
            display_list_of_houses
            ask_user_for_house_choice
            menu
        elsif          
            user_input == "no"
            exit_program
        else 
            sleep(1)
            puts "Please select a valid choice."
            menu
        end
    end

    # def first_user_input
    # end

    # .each is best for printing out
    def display_list_of_houses
        House.all.each.with_index(1) do |house, index|  
            puts "#{index}. #{house.name}" 
        end
        puts "\n" 
    end
         
   def ask_user_for_house_choice
        house_input = gets.strip.to_i - 1 
        max = House.all.length - 1
        until house_input.between?(0,max) 
            sleep(1)
            puts "Please select a valid number."
            house_input = gets.strip.to_i - 1
        end
        house_instance = House.all[house_input]
        display_house_details(house_instance) 
        save_chosen_house(house_instance) 
    end

    def  display_house_details(house) 
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


    def save_chosen_house(house)
        puts "\n" 
        puts "Do you think you could be allies? (type yes or no)"
        puts "\n" 
        input = gets.strip.downcase
        if input == "yes"
            @@all << house.name.to_s   
            puts "\n" 
            puts "Excellent. I have saved this choice for you in your journal."
            puts "\n" 
        elsif input == "no"
            @@all.delete(house.name)
           # binding.pry
            puts "\n" 
            puts "Very well. Let's find you another House."
            puts "\n" 
            menu
        else 
            puts "Please select a valid number."
            input = gets.strip.downcase
        end
    end

    # def remove_house(house)
    #     @@all.delete(house)  # NEEDS MORE WORK
        
    # end
 
    def exit_program
        if @@all.empty?
            puts "\n" 
            puts "Farewell, then. With no allies, I expect you'll be dead in less than a fortnight."
            exit
        else 
            puts "You have chosen the following houses as your allies:"
            sleep(1)
            puts @@all.uniq
            puts "\n" 
            sleep(1)
            puts "Now go forth and introduce yourself. Good luck!"
            exit
        end
        return
    end

    # def self.clear # was on house.rb
    #     @@all.clear
    # end


end

# find_by_name
#   query