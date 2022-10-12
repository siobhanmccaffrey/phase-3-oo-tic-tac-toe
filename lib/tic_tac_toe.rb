class TicTacToe

    WIN_COMBINATIONS = [
        [0,1,2],
        [3,4,5],
        [6,7,8],
        [0,3,6],
        [1,4,7],
        [2,5,8],
        [0,4,8],
        [2,4,6]
    ]
    def initialize (board=[" ", " ", " ", " ", " ", " ", " ", " ", " "])
        @board = board
    end

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
      end
    
      def input_to_index(user_input) #user_input as an argument
        user_input.to_i - 1 #user_input(string) .to an INTEGER - then convert from the user input to OG array friendly format (it starts at 0, hence we use -1)
      end

      def move(index, token=X) #taking in two arguments: index of boards array and the players token (X or O)
        @board[index] = token
      end

      def position_taken?(index) #running after input_to_index- checking index values, checking for vacancy
        @board[index] != " " #return false( if position not taken)(looking for string value bc user input) 
      end

      def valid_move?(index) #accepts the position to consider vv
        !position_taken?(index) && index.between?(0,8) #if not taken & if it is on the gameboard(0-8, in array friendly terms)
      end

      def turn_count 
        @board.count{|square| square != " " } #checking to see # of turns taken based on board
      end
    
      def current_player
        turn_count.even? ? "X" : "O" #using the turn count method to translate to it being  X or O turn
      end

      def turn 
        puts "Please enter number (1-9): "
        user_input = gets.strip
        index = input_to_index(user_input)
        if valid_move?(index)
            token = current_player
            move(index,token)
        else
            turn
        end
        display_board
      end

end