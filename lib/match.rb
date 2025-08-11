require_relative 'player'
require_relative 'gameboard'
# classe che gestisce l'andamento dell'intero gioco appoggiandosi sulla classe Gameboard e PLayer
class Match
  def initialize
    @player_one = Player.new('Fabio', 'X')
    @player_two = Player.new('Biagio', 'O')
    @gameboard = Gameboard.new
  end

  def start_game
    game_is_on = true
    while game_is_on
      turn(@player_one)
      if check_endgame?(@player_one) == true
        game_is_on = false
        p "#{@player_one.name} wins"
      else
        turn(@player_two)
        if check_endgame?(@player_two) == true
          game_is_on = false
          p "#{@player_two.name} wins"
        end
      end
    end
  end

  def turn(current_player)
    position = current_player.make_choice
    until @gameboard.check_position?(position) == true
      puts 'Position not valid'
      position = current_player.make_choice
    end
    @gameboard.update_position(current_player.symbol, position)
    @gameboard.display_gameboard
    # check_endgame?
  end

  def check_endgame?(current_player)
    check_rows?(current_player)
    check_columns?(current_player)
  end

  def check_rows?(current_player)
    #  1 CONDITION: if all elements in a row are the same (X or O) return TRUE
    board = @gameboard.board
    board.each do |row|
      return true if row.all? { |element| element == current_player.symbol }
    end
  end

  def check_columns?(current_player)
    #  2 CONDITION: if all elements in a column (across multiple arrays) are the same (X or O) return TRUE.
    #  Loop sulle righe della board. Prendi index_0 delle 3 righe e lo aggiungi a new_array. Controlli new_array. index + 1. Ripeti il loop sulle righe con index_1
    board = @gameboard.board.transpose
    board.each do |row|
      return true if row.all? { |element| element == current_player.symbol }
    end
  end

  def check_diagonals?(current_player)
    #  3 CONDITION: if all elements in diagonal (across multiple arrays) are the same (X or O) return TRUE
  end

  def check_for_draw?
    #  4 CONDITION: if none of the arrays contains a number then the board is full and it is a draw, return TRUE
  end
end

game = Match.new

game.start_game
