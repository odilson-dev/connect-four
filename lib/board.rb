class Board
    attr_reader :board
    def initialize(rows = 6, columns = 7)
        @rows = rows
        @columns = columns
        @board = Array.new(rows) { Array.new(columns, ' ') }
      end

 
end
