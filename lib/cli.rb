# this page interacts with the user
# any puts or gets statements
#control the flow of our program


class Cli

    @@all = []

    # a new step needs a new method
    # start should be sparse - welcome, grab info, take us to another method in CLI

    # welcome, grab info, and take us to other method that controls main object
    def start
        puts "A WELCOME GUIDE TO THE NORTH"   
        Api.fetch_houses
        self.menu
    end

    def menu
        puts "\n" # new line
        puts "Would you like to meet some potential allies? (type yes or no)"
        user_input = gets.strip.downcase # user inputs y/n
        if user_input == "yes"  
            puts "\n" # new line
            puts "Wise decision."
            puts "\n" # new line
            puts "Let's take a look at some of the houses that are held in the highest regard."
            puts "Please choose by entering the number of the House you wish to explore:"
            puts "\n" # new line
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
        House.all.each.with_index(1) do |house, index|  # 1 is starting value argument
            puts "#{index}. #{house.name}"  # interpolate
        end
        puts "\n" # new line
    end
         
   def ask_user_for_house_choice
        house_input = gets.strip.to_i - 1 #user puts # for house, corresponds with our array index numbers
        #validate their input
        max = House.all.length - 1
        until house_input.between?(0,max) 
            sleep(1)
            puts "Please select a valid number."
            house_input = gets.strip.to_i - 1
        end
        # Find their House choice 
        house_instance = House.all[house_input]
        # call the method that will print details
        display_house_details(house_instance)
        save_chosen_house(house_instance)
    end

    def  display_house_details(house) # argument so we know their choice still - arg better
        # print out their choice
        puts "\n" # new line
        puts "Name: " + house.name
        puts "Region: " + house.region
        puts "Words: " + house.words.to_s
        puts "Titles: " + house.titles.join(", ") 
        puts "Seats: " + house.seats.join(", ") 
        puts "Coat of Arms: " + house.coatOfArms
        #binding.pry
        print "Ancestral Weapons: "
        puts house.ancestralWeapons[0] == "" ? "None on record." : house.ancestralWeapons.join(", ")
        binding.pry
       # puts output
    end


    def save_chosen_house(house)
        puts "\n" # new line
        puts "Do you think you could be allies? (type yes or no)"
        puts "\n" # new line
        input = gets.strip.downcase
        if input == "yes"
            @@all << house.name.to_s   
            puts "\n" # new line
            puts "Excellent. I have saved this choice for you in your journal."
            puts "\n" # new line
        else puts "\n" # new line
            puts "Very well. Let's find you another House."
            puts "\n" # new line
            menu
        end
    end

 
    def exit_program
        if @@all.empty?
            puts "\n" # new line
            puts "Farewell, then. With no allies, I expect you'll be dead in less than a fortnight."
            exit
        else 
            puts "You have chosen the following houses as your allies:"
            sleep(1)
            puts @@all.uniq
            puts "\n" # new line
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