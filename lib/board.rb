class Board
  attr_reader :board
  def initialize(rows = 6, columns = 7)
      @rows = rows
      @columns = columns
      @board = Array.new(rows) { Array.new(columns, ' ') }
  end

  def display_board
    puts "  1   2   3   4   5   6   7"
    puts "+---+---+---+---+---+---+---+"
    @rows.times do |row|
        row_display = "|"
        @columns.times do |col|
            row_display += " #{@board[row][col]} |"
        end
        puts row_display
    puts "+---+---+---+---+---+---+---+"
    end
  end

  def drop_token(column, player)
    row = @rows - 1
    while row >= 0
      if @board[row][column - 1] == ' '
        @board[row][column - 1] = player.token
        return true
      end
      row -= 1
    end
    false
  end

  def check_winner(player)
    # checking horizontal rows

    @rows.times do |row|
      (@columns - 3).times do |col|
        if @board[row][col] == player.token &&
          @board[row][col + 1] == player.token &&
          @board[row][col + 2] == player.token &&
          @board[row][col + 3] == player.token
          return true
        end
      end
    end

    # checking horizontal rows
    (@rows - 3).times do |row|
      @columns.times do |col|
        if @board[row][col] == player.token &&
          @board[row + 1][col] == player.token &&
          @board[row + 2][col] == player.token &&
          @board[row + 3][col] == player.token
          return true
        end
      end
    end

   # checking diagonals rows TOP to BOTTOM -> (\)
    (@rows - 3).times do |row|
      (@columns - 3).times do |col|
        if @board[row][col] == player.token &&
          @board[row + 1][col + 1] == player.token &&
          @board[row + 2][col + 2] == player.token &&
          @board[row + 3][col + 3] == player.token
          return true
        end
      end
    end

    # checking diagonals rows BOTTOM to TOP -> (/)
    (@rows - 3).times do |row|
      (3..@columns - 1).each do |col|
        if @board[row][col] == player.token &&
          @board[row + 1][col - 1] == player.token &&
          @board[row + 2][col - 2] == player.token &&
          @board[row + 3][col - 3] == player.token
          return true
        end
      end
    end
    return false
  end

  def full?
  end
end
