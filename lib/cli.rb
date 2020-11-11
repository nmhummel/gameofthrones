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
        sleep(1)    
        puts "So there's a big hole in The Wall and you came through it. Now what?"
        puts "======================================================================"
        puts "---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+--"
        puts "o | o   o | o   o | o   o | o   o | o   o | o   o | o   o | o   o | o"
        puts "---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+--"
        puts "o | o   o | o   o | o   o | o   o | o   o | o   o | o   o | o   o | o"
        puts "---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+--"
        puts "o   o | o   o | o   o | o   o | o   o | o   o | o   o | o   o | o   o"
        puts "---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+--"
        puts "o | o   o | o   o | o   o | o   o | o   o | o   o | o   o | o   o | o"
        puts "---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+--"
        puts "o   o | o   o | o   o | o   o | o   o | o   o | o   o | o   o | o   o"
        puts "---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+--"
        puts "o | o   o | o   o | o   o | o   o | o   o | o   o | o   o | o   o | o"
        puts "---+---+---+---+---+---+---+---+---+---+---+---+---+             --+--"
        puts "o   o | o   o | o   o | o   o | o   o | o   o | o               o   o"
        puts "---+---+---+---+---+---+---+---+---+---+---+---+---+-            --+--"
        puts "o | o   o | o   o | o   o | o   o | o   o | o   o |             o | o"
        puts "---+---+---+---+---+---+---+---+---+---+---+---+---+-           ---+--"
        puts "\n" # new line
        puts "The Game of Thrones has ended, but that doesn't mean you can just march into The North without some allies."
        puts "You really need to become familiar with the different Houses around here. Good thing I'm here to help."
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
            puts "Please select a valid choice."
            menu
        else 
            user_input == "no"
            exit_program
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
        house_input = gets.strip.to_i #user puts # for house
        index = house_input - 1 # corresponds with our array index numbers
        #validate their input
        max = House.all.length - 1
        until index.between?(0,max) 
            puts "Please select a valid number."
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
        puts "\n" # new line
        puts "Do you think you could be allies? (choose yes or no)"
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
            puts "\n" # new line
            sleep(2)
            puts "                               __   "
            puts "                            .d$$b   "
            puts "                         .' TO$;\   "
            puts "                       /  : TP._;   "
            puts "                     / _.;  :Tb|   "
            puts "                    /   /   ;j$j   "
            puts "                _.-^       d$$$$^   "
            puts "               .' ..       d$$$$;   "
            puts "              /  /P'      d$$$$P. - }   "
            puts "             /   ^      .d$$$P'^^^^}   "
            puts "           .'           `T$P^^^^^^^  :   "
            puts "      ._.'      _.'                ;   "
            puts "    `-.-^.-'-' ._.       _.-    .-   "
            puts "  `.-^ _____  ._              .-   "
            puts " -(.g$$$$$$$b.              .'   "
            puts "    ^^T$$$P^)            .(:   "
            puts "       _/  -^  /.^         /:/;   "
            puts "      ._.'-'`-^  ^)/         /; / ; "
            puts "   `-.- ^..--^   ^ /         /  ;   "
            puts "  .-^ ..--^^        -^          :   "
            puts " ..--^^--.-^         (\      .-(\   "
            puts "   ..--^^              `-\(\/;`   "
            puts "  _.                      :   "
            puts "                         ;`-   "
            puts "                        :\   "
            puts "                       ;  bug   "
            exit
        else 
            puts "You have chosen the following houses as your allies:"
            sleep(1)
            puts "\n" # new line
            puts @@all
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