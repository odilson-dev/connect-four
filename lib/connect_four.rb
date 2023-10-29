require_relative 'board'
require_relative 'player'

require 'colorize'

def game
    board = Board.new

    board.display_board

    # Create Player 1 and Player 2
    puts "Enter the name of the first player"
    player_1_name = gets.chomp
    player_1 = Player.new(player_1_name, "X".light_green)
    puts "Hello #{player_1.name}, the piece '" + "X".light_green + "' has been assigned to you \n"

    puts "Enter the name of the second player"
    player_2_name = gets.chomp
    player_2 = Player.new(player_2_name, "O".light_blue)
    puts "Hello #{player_2.name}, the piece '" + "O".light_blue + "' has been assigned to you \n"

    puts "Okay! The game can start now. \u{1f929} \n".light_blue


    current_player = player_1
    loop do
      if board.full?
        puts "GAME OVER! \U{1F62A}".light_red
        break
      else
        puts "#{current_player.name}, it's your turn, please choose a column (1-7):"
        column = gets.to_i
        if column >= 1 && column <= 7
          if board.drop_token(column, current_player)
            board.display_board
            if board.check_winner(current_player)
              puts "CONGATULATIONS #{current_player.name.upper} \U{1F973}, YOU WON!!!".light_green
              break
            end
            current_player == player_1 ? current_player = player_2 : current_player = player_1
          else
            puts "Column is full. Choose another column.".light_cyan
          end
        else
          puts "Invalid input. Please choose a column from 1 to 7.".light_cyan
        end
      end
  end
end

def start
  game
  loop do
      puts "Do you want to play again? [y/n]"
      play = gets.chomp
      if play == 'n'
          puts "Thank you for playing guys.\nHere is my GitHub account: odilsonjs"
          puts "Don't hesitate to throw an eye there for more projects and games"
          puts "Ciao!"
          break
      end
      game
  end
end