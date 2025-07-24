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
    @board.each do |nested_array|
      nested_array.each do |cell|
        return true if cell == position
      end
    end
    false
  end

  def update_position
  end
end

gameboard = Gameboard.new
p gameboard.check_position?(4)
