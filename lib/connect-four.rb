require_relative 'board'
require_relative 'player'

def play
    board = Board.new
    loop do
        board.display_board
        
        # Create Player 1 and Player 2
        puts "Enter the name of the fisrt player"
        player_1_name = gets.chomp
        player_1 = Player.new(player_1_name, "X")
        puts "Hello #{player_1.name}, the piece 'X' has been assigned to you"

        puts "Enter the name of the second player"
        player_2_name = gets.chomp
        player_2 = Player.new(player_2_name, "O")
        puts "Hello #{player_2.name}, the piece 'O' has been assigned to you"

        
      end
end