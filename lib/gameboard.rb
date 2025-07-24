# Classe che crea e gestisce la gameboard. Controlla se la cell é disponibile e posiziona la scelta del Player
class Gameboard
  def initialize
    @board = []
    n = 1
    3.times do |nested_array|
      @board[nested_array] = []
      3.times do |cell|
        @board[nested_array][cell] = n
        n += 1
      end
      p @board[nested_array]
    end
  end

  def check_position?(position)
    row = (position - 1) / @board.length
    column = (position - 1) % @board.length
    false unless @board[row][column] == position
  end

  def update_position(symbol, position)
    row = (position - 1) / @board.length
    column = (position - 1) % @board.length
    @board[row][column] = symbol
  end

  def display_gameboard
    @board.each { |row| p row }
  end
end

gameboard = Gameboard.new
gameboard.check_position?(9)
gameboard.update_position('X', 9)
gameboard.display_gameboard
