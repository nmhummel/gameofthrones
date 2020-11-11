require_relative '../environment.rb'

class Cli

    @@all = []

    # a new step needs a new method
    # start should be sparse - welcome, grab info, take us to another method in CLI

    def start
        puts "A WELCOME GUIDE TO THE NORTH"
        #insert bantor
        puts "Would you like to meet some potential allies? (type yes or no)"
        user_input = gets.strip.downcase 
        # user inputs y/n
        if user_input == "no"   # all this works - do not touch!!!
            if @@all.empty?
                puts "Farewell, then. With no allies, I expect you'll be killed in less than a fortnight."
            else 
                puts "You have chosen the following houses as your allies:"
                puts @@all
                puts "Now go forth and prosper!"
            end
        else  # still working
            puts "Wise decision."
            sleep(1)
            api = Api.new
            Api.create_houses   # error in terminal on this line
            self.display_houses # prints all houses with 1-9
            index = self.house_input    # user chooses # for house 1-9 and it prints the house chosen
                # DON'T NEED? query = Cli.topics[index]
                # OR HERE? api = Api.new
                # OR HERE? api.create_houses
                # DON'T NEED? index = self.secondary_input
            self.display_chosen_house(index)
            # self.another_article?
        end
    end

    # .each is best for printing out
    def input_to_index(input)
        input.to_i - 1
    end

    def self.display_houses # was on house.rb
        puts "Let's take a look at some of the houses that are held in the highest regard. Please choose by entering the number of the House you wish to explore:"
        House.all.each.with_index(1) do |house, index|
            puts "#{index}. #{house.name}"
        end
    end

    def house_input
        input = gets.strip  #user puts # for house
        index = input_to_index(input)
        if !index.between?(0,8)
            puts "Please select a number between 1 and 9."
            self.house_input
        else
            index
        end
    end

    def self.display_chosen_house(index) # was on house.rb
        house = self.all[index]
        puts "Name: " + house.name
        puts "Region: " + house.region
        puts "Words: " + house.words
        puts "Seats: " + house.seats
        puts "Coat of Arms: " + house.coatOfArms
        puts "Ancestral Weapons: " + house.ancestralWeapons
    end


    def save_houses
        puts "Do you think you could be allies? (choose yes or no)"
        house = gets.strip
        if house == "yes"
            @@all << house
        else puts "Very well. Let's find you another House."
            menu
        end
    end
 
    def self.clear # was on house.rb
        @@all.clear
    end


end
puts "cli"
