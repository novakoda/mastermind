class Game
    attr_accessor :pattern
    attr_accessor :valid_colors
    attr_accessor :turn
    attr_accessor :choice
    
    def initialize
        @pattern = []
        @valid_colors = ["black", "white", "green", "red", "yellow", "blue"]
        @turn = 0
        4.times do
            @pattern << @valid_colors.sample
        end
        puts @pattern
        puts "Can only be black, white, green, red, yellow, or blue"
        puts ""
    end

    def turn
        @choice = []
        @turn += 1

        puts "Turn #{@turn} of 10"
        puts ""

        i = 0
        4.times do 
            puts "Enter a color for slot #{i+1}"
            color = gets.chomp.downcase

            if !@valid_colors.include? color
                puts "Invalid entry"
                redo 
            end
            puts ""

            @choice << color
            i += 1
        end

        self.respond
        
        
        if @choice == @pattern
            puts "You win!"
        elsif @turn > 9 && @choice != @pattern
            puts "Out of turns - You lose!"
        else
            self.turn
        end
    end

    def respond
        pattern_pool = @pattern.clone
        response = []
        
        @choice.each_with_index do |color, slot|
            if @pattern[slot] == @choice[slot]
                response << "red" 
                pattern_pool[slot] = nil  
            else
                slot_with_color = pattern_pool.index(color)
                if slot_with_color != nil
                    pattern_pool[slot_with_color] = nil
                    response << "white"
                else 
                    response << "blank"
                end
            end
        end

        puts "The results for turn #{@turn} are #{response.shuffle}"
        puts "-----------"
        puts ""
    end
    

    def finish

    end



    def play
        self.turn
    end
end
