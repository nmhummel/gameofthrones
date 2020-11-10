require_relative '../environment.rb'
require 'pry'

class Cli

    
    @@saved_houses = []

    def start
        puts "The Houses of Game of Thrones"
        puts "Here there be dragons...eventually."
        puts "==================================================================="
        menu
    end
    # a new step needs a new method
    # start should be sparse - welcome, grab info, take us to another method in CLI

    def menu
        puts "If you're going to play the Game of Thrones, you must know more about the teams."
        sleep(1)
        puts "Would you like to see who's playing? (type yes or no)"
        user_input = gets.strip.downcase 
        # user inputs y/n
        if user_input == "no"   # all this works - do not touch!!!
            if @@saved_houses.empty?
                puts "Farewell. With no allies, I expect I'll see your head on a spike in the near future."
            else 
                puts "You have chosen the following houses as your allies:"
                puts @@saved_houses
            end
        else  # still working
            puts "Wise decision."
            sleep(1)
            puts "What region are you in right now? If you aren't sure, ask a local. I'll wait."
            sleep(5)
            Region.display_regions # lists all regions displayed like 1. Vale, etc.
            Region.ask_user_for_region  # error here
            display_list_of_houses

            ask_user_for_house

            sleep(1)
            menu

            # elsif user_input == 'search'
            # list all search options
            # menu (recursion)
        end
    end

    #  display_list_of_houses

    # .each is best for printing out


    def ask_user_for_house
        chosen_index = gets.strip.to_i - 1
         #max_limit = House.all.length - 1
        if !chosen_index.between(0,House.all.length)  # get actual number once you get it printing, includes edge cases 
            puts "Invalid choice. Try again."
            ask_user_for_house
        end
        house_instance = House.all[index]
        display_house_details(house_instance)
    end

    def display_house_details(house_instance)
        sleep(1)
        puts "\n"
        puts house.name
        puts "Region: " + house.region
        puts "Words: " + house.words
        puts "Coat of Arms: " + house.coatOfArms
        puts "Ancestral Weapons: " +house.ancestralWeapons
    end

    def liked_houses
        puts "Do you think you could be allies? (choose yes or no)"
        house = gets.strip
        if house == "yes"
            @@saved_houses << house
        else puts "Very well. Let's find you another House."
            menu
        end
    end

end
puts "cli"
