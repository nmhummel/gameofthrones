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
        sleep(2)        
        puts "The Game of Thrones has ended, but that doesn't mean you can just march into The North without some allies."
        puts "You really need to become familiar with the different Houses around here. Good thing I'm here to help."
        Api.fetch_houses
        self.menu
    end

    def menu
        puts "Would you like to meet some potential allies? (type yes or no)"
        user_input = gets.strip.downcase # user inputs y/n
        if user_input == "no"  # all this works - do not touch!!!
            if @@all.empty?
                puts "Farewell, then. With no allies, I expect you'll be dead in less than a fortnight."
            else 
                puts "You have chosen the following houses as your allies:"
                puts @@all
                puts "Now go forth and introduce yourself. Good luck!"
            end
        else  # still working
            puts "Wise decision."
            sleep(1)
            puts "Let's take a look at some of the houses that are held in the highest regard."
            puts "Please choose by entering the number of the House you wish to explore:"
            display_list_of_houses
            ask_user_for_house_choice
            sleep(1)
            menu
        end
    end

    # .each is best for printing out
    def display_list_of_houses
        House.all.each.with_index(1) do |house, index|  # 1 is starting value argument
            puts "#{index}. #{house.name}"  # interpolate
        end
    end
         
   def ask_user_for_house_choice
        house_input = gets.strip.to_i #user puts # for house
        index = house_input - 1 # corresponds with our array index numbers
        #validate their input
        max = House.all.length - 1
        until index.between?(0,max) 
            puts "Please select a number between 1 and #{max}."
            index = gets.strip.to_i - 1
        end
        # Find their House choice 
        house_instance = House.all[index]
        # call the method that will print details
        display_house_details(house_instance)
        save_chosen_house(house_instance)
    end

    def  display_house_details(house) # argument so we know their choice still - arg better
        # print out their choice
        # house = self.all[index]
        puts "\n" # new line
        puts "Name: " + house.name.to_s
        puts "Region: " + house.region.to_s
        puts "Words: " + house.words.to_s
        puts "Seats: " + house.seats.to_s
        puts "Coat of Arms: " + house.coatOfArms.to_s
        puts "Ancestral Weapons: " + house.ancestralWeapons.to_s
    end


    def save_chosen_house(house)
        puts "Do you think you could be allies? (choose yes or no)"
        input_yn = gets.strip
        if input_yn == "yes"
            @@all << house
        else puts "Very well. Let's find you another House."
            menu
        end
    end
 
    def self.clear # was on house.rb
        @@all.clear
    end


end

