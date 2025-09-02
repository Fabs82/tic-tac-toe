# Classe che crea e gestisce la gameboard. Controlla se la cell é disponibile e posiziona la scelta del Player
class Gameboard
  attr_reader :board

  def initialize
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
    row = (position - 1) / @board.length
    column = (position - 1) % @board.length
    # p @board[row][column]
    @board[row][column] == position
  end

  def update_position(symbol, position)
    row = (position - 1) / @board.length
    column = (position - 1) % @board.length
    @board[row][column] = symbol
  end

  def display_gameboard
    # @board.each { |row| row.join(' | ') }
    puts "\n"
    @board.each_with_index do |row, idx|
      puts row.join(' | ')
      puts '---------' if idx < 2
    end
    puts "\n"
  end
end

# test per controllo funzionalità
# gameboard = Gameboard.new
# gameboard.check_position?(1)
# gameboard.update_position('X', 9)
