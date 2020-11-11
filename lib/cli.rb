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
                puts @@all[0]
                puts "Now go forth and prosper!"
            end
        else  # still working
            puts "Wise decision."
            sleep(1)
            House.display_houses

            # index = self.initial_input
            # query = Cli.topics[index]
            # api = Api.new(query)
            # api.create_articles
            # Article.display_articles
            # index = self.secondary_input

            # Article.display_article(index)
            # self.another_article?
        end
            # House.display_houses # lists all regions displayed like 1. Vale, etc.
            # index = initial_input # gets their selection and validates it's 1-10
  
            #region_query = Api.new(user_region) # left off here
            # RETURNING #<Api:0x000055689657cde0 @user_region=nil> with multiple requests of region_query


            # Region.ask_user_for_region  # error here
       
            #display_list_of_houses

            #ask_user_for_house

            #sleep(1)
            #menu

            # elsif user_input == 'search'
            # list all search options
            # menu (recursion)
      
    end

    #  display_list_of_houses

    # .each is best for printing out
    def input_to_index(input)
        input.to_i - 1
    end

    def house_input
        input = gets.strip  #user puts # for house
        index = input_to_index(input)

        if !index.between?(0,28)
            puts "Please select a number between 1 and 10."
            self.initial_input
        else
            index
        end
    end



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


    def liked_houses
        puts "Do you think you could be allies? (choose yes or no)"
        house = gets.strip
        if house == "yes"
            @@all << house
        else puts "Very well. Let's find you another House."
            menu
        end
    end

end
puts "cli"
