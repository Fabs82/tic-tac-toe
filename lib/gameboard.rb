# A class that creates and manages the game board. It checks if the cell is available and places the player's choice.
class Gameboard
  attr_reader :board

  def initialize
    # A 3x3 matrix
    @board = []
    n = 1
    3.times do |nested_array|
      @board[nested_array] = []
      3.times do |cell|
        @board[nested_array][cell] = n
        n += 1
      end
    end
  end

  def check_position?(position)
    # Returns TRUE if the number entered by the player is equal to the number in the chosen cell.
    row = (position - 1) / @board.length
    column = (position - 1) % @board.length
    @board[row][column] == position
  end

  def update_position(symbol, position)
    row = (position - 1) / @board.length
    column = (position - 1) % @board.length
    @board[row][column] = symbol
  end
end
