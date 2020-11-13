class Cli

    @@regions = ["The North", "Iron Islands", "Dorne", "The Vale", "The Reach", "The Riverlands", "The Crownlands", "The Stormlands", "The Westerlands"]
    @@saved_houses = []

    def start
        puts "                                   ___....-   "
        puts "                         __...~~~^^^^      / )  "
        puts "                 _..~~^^^                 /  "
        puts "           y-K-<~....                    /  "
        puts "        ,    )W\\^.. ^^^^^^^ ~~~~~~====(  "
        puts "     ..f      ) \\  ^^~~~--p         /  )  "
        puts " ..,6)  ^_     \ \\        ^^^~~====(  "
        puts "(o        ^.    ) H           __/^   )  "
        puts "  ^^~~~^.   ^^~/,//,,,,,,,,,(_____  "
        puts "         ^.                   __. ^^^^^~~~.._        ^  "
        puts "           ^.     /^^       /^              _K=======II>  "
        puts " Art by     ^^~.C   /     C     |   _..~~^^         v  "
        puts "  Amthralyx      (  C~~~~~~(    C~~^^  "
        puts "                  | |       \   .  "
        puts "               / -' '-..    _|  |  "
        puts "              ' /'       ././'  '--.  "
        puts "=================WELCOME TO WESTEROS====================" 
        puts "\n" 
        sleep(1)
        puts "Well met, stranger. My name is Natalie of House Stark. There have been many strange occurences as of late. Best to be on your guard."
        sleep(3)
        puts "If you're going to live in Westeros and play the Game of Thrones, you need to be familiar with the teams."
        sleep(2)
        menu
    end

    def menu
        self.display_regions 
        index = self.regions_input 
        query = @@regions[index] 
        api = Api.new(query) 
        api.create_houses
        display_houses 
    end
  
    def display_regions
        House.clear_all
        puts "\n"
        puts "Tell me-- which of the below regions are you interested in? (enter number 1-8, or 'exit' to be on your way)"
        puts "\n"
        sleep(1)
        @@regions.each_with_index {|region, index| puts "#{index + 1}. #{region}"}
        puts "\n" 
    end

    def selection_to_index(input)
        input.to_i - 1
    end 

    def regions_input 
        input = gets.strip
        if input == "exit"
            exit_program
        else
            number = selection_to_index(input)
            until number.between?(0,8)
                sleep(1)
                puts "Please select a valid number."
                input = gets.strip
            end
            input.to_i
        end
    end
   
    def display_houses   
        puts "\n"
        puts "Would you like to meet some potential allies here, or would you like to try a different region? "
        puts "(type 'yes' for allies, 'no' for a different region, or 'exit' to be on your way)"
        puts "\n" 
        user_input = gets.strip.downcase
        if user_input == "yes"  
            puts "\n" 
            puts "Wise decision. Let's take a look at some of the houses that are held in the highest regard."
            sleep(1)
            puts "Please choose by entering the number of the House you wish to explore:"
            puts "\n" 
            display_list_of_houses 
            ask_user_for_house_choice 
            display_houses 
        elsif          
            user_input == "no"
            House.clear_all
            menu 
        elsif
            user_input == "exit"
            exit_program
        else 
            sleep(1)
            puts "Please select a valid choice."
            display_houses 
        end
    end   
 
    def display_list_of_houses 
        House.all.each.with_index(1) {|house, index| puts "#{index}. #{house.name}"} 
        puts "\n" 
    end

    def ask_user_for_house_choice 
        input = gets.strip
        max = House.all.length - 1 
        house_input = selection_to_index(input)        
        until house_input.between?(0,max) 
            sleep(1)
            puts "Please select a valid number."
            house_input = gets.strip.to_i - 1
        end
        house_instance = House.all[house_input]
        display_house_details(house_instance)
        save_chosen_house(house_instance)
    end

    def display_house_details(house)
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
        puts "Do you think you could be allies?"
        puts "(type 'yes' to add them to your list, 'no' to see more, or 'exit' to be on your way)"
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
            puts "Type 'stay' to stay in this region, 'move' to go elsewhere, or 'exit' to be on your way." 
            input == "stay" ? display_houses : display_list_of_houses 
            
        elsif input =="move"
            House.clear_all
            display_regions
        elsif input =="exit"
            exit_program
        else 
            puts "Please select a valid number."
            input = gets.strip.downcase
        end
    end

    def exit_program
        if @@saved_houses.empty?
            puts "\n" 
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
            puts @@saved_houses.uniq # of Region
            puts "\n" 
            sleep(1)
            puts "Now go forth and introduce yourself. Good luck!"
            exit
        end
        return
    end

    def self.regions
        @@regions
    end


end