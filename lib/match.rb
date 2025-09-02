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
    @gameboard.display_gameboard
    game_is_on = true
    players = [@player_one, @player_two]
    position = 0
    while game_is_on
      current_player = players[position % 2]
      p "TURN NUMBER #{position + 1}"
      turn(current_player)
      if check_winner?(current_player)
        p "#{current_player.name} wins"
        game_is_on = false
      elsif check_for_draw?
        p 'It is a draw'
        game_is_on = false
      else
        position += 1
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

  def check_winner?(current_player)
    return true if check_rows?(current_player)
    return true if check_columns?(current_player)
    return true if check_diagonals?(current_player)

    false
  end

  def check_rows?(current_player)
    #  1 CONDITION: if all elements in a row are the same (X or O) return TRUE else return FALSE
    board = @gameboard.board
    board.each do |row|
      return true if row.all? { |element| element == current_player.symbol }
    end
    false
  end

  def check_columns?(current_player)
    #  2 CONDITION: if all elements in a column (across multiple arrays) are the same (X or O) return TRUE else return FALSE
    board = @gameboard.board.transpose
    board.each do |row|
      return true if row.all? { |element| element == current_player.symbol }
    end
    false
  end

  def check_diagonals?(current_player)
    #  3 CONDITION: if all elements in diagonal (across multiple arrays) are the same (X or O) return TRUE else return FALSE
    board = @gameboard.board
    first_diagonal = [board[0][0], board[1][1], board[2][2]]
    second_diagonal = [board[0][2], board[1][1], board[2][0]]
    first_diagonal.all? { |element| element == current_player.symbol } ||
      second_diagonal.all? { |element| element == current_player.symbol }
  end

  def check_for_draw?
    #  4 CONDITION: if none of the arrays contains a number then the board is full and it is a draw, return TRUE
    board = @gameboard.board.flatten(3)
    true if board.none? { |element| element.is_a?(Integer) }
  end
end

game = Match.new
game.start_game
