require_relative '../environment.rb'

class Cli

    def start
        puts "The Houses of Game of Thrones"
        puts "Here there be dragons...eventually."
        puts "                 ^    ^ "
        puts "                / \  // \ "
        puts "  |\___/|      /   \// \ \ "
        puts "  /O  O  \__  /    // | \ \ "
        puts " /     /  \/_/    //  |  \  \ "
        puts " @___@'    \/_   //   |   \  \ "
        puts "    |       \/_ //    |    \   \ "
        puts "    |        \///     |     \    \ "
        puts "   _|_ /   )  //      |      \    _\ "
        puts "  '/,_ _ _/  ( ; -.   |    _ _\.-~     .-~~~^-. "
        puts " ,-{        _      `-.|.-~-.          .~        `. "
        puts " '/\      /                  ~-. _ .-~    .-~^-.  \\ "
        puts "    `.   {            }                  /       \  \ "
        puts "  .----~-.\        \-'                .~          \  `.   \^-."
        puts "  ///.----..>    c   \            _ -~              `.  ^-`   ^-_"
        puts "    ///-._ _ _ _ _ _ _}^ - - - - ~                     ~--,   .-~"
        puts "                                                         /.-' "
        puts "==================================================================="
        Api.fetch_houses
        self.menu
    end
    # a new step needs a new method
    # start should be sparse - welcome, grab info, take us to another method in CLI

    def menu
        puts "If you're going to play the Game of Thrones, you must know more about the teams."
        puts "Would you like to see who's playing? (type yes or no)"
        user_input = gets.strip.downcase
        if user_input == "yes"
            puts "Wise decision."
            display_list_of_houses
            ask_user_for_house
        else
            puts "I expect to see your head on a spike."
        end
    end

    def display_list_of_houses
        House.all.each.with_index(1) do |house, index|
            puts "#{index}. #{house.name}"
        end
    end
    # .each is best for printing out

    def ask_user_for_house
        chosen_index = gets.strip.to_i - 1
        house_instance = House.all[index]
    end


    # def choose_characters
    #     if Book.all.empty? 
    #         Character.create_characters
    #     else
    # # if book.all.length == 0, call method and end
    # # else use book.all method and print out
    # # Book.create_books
    #     end
    # end


end

