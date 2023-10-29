require_relative 'board'
require_relative 'player'

def game
    board = Board.new

    board.display_board

    # Create Player 1 and Player 2
    puts "Enter the name of the first player"
    player_1_name = gets.chomp
    player_1 = Player.new(player_1_name, "X")
    puts "Hello #{player_1.name}, the piece 'X' has been assigned to you"

    puts "Enter the name of the second player"
    player_2_name = gets.chomp
    player_2 = Player.new(player_2_name, "O")
    puts "Hello #{player_2.name}, the piece 'O' has been assigned to you"


    current_player = player_1
    loop do

        puts "#{current_player.name}, it's your turn, choose a column (1-7):"
        column = gets.to_i
        if column >= 1 && column <= 7
          if board.drop_token(column, current_player)
            board.display_board
            if board.check_winner(current_player)
              puts "Congratulations #{current_player.name}, you win!"
              break
            end
            current_player == player_1 ? current_player = player_2 : current_player = player_1
          else
            puts "Column is full. Choose another column."
          end
        else
          puts "Invalid input. Please choose a column from 1 to 7."
        end
    end
end

def start
  loop do
      game
      play = puts "Do you want to play again? [y/n]"
      if play == 'y'
          puts "Thank you for playing.\nHere is my GitHub account: odilsonjs"
          puts "Don't hesitate to throw an eye there for more projects and games"
          puts "Ciao!"
          break
      end
  end
end