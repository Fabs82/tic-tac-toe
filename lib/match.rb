require_relative 'player'
require_relative 'gameboard'
require 'colorize'
# A class that manages the progression of the entire game by relying on the Gameboard and Player classes.
class Match
  def initialize
    @player_one = Player.new('Player 1', 'X'.colorize(:red))
    @player_two = Player.new('Player 2', 'O'.colorize(:green))
    @gameboard = Gameboard.new
    @player_position = 0
  end

  def start_game
    @gameboard.display_gameboard
    game_is_on = true
    players = [@player_one, @player_two]
    while game_is_on
      current_player = players[@player_position % 2]
      puts "TURN NUMBER #{@player_position + 1}"
      turn(current_player)
      if check_winner?(current_player)
        puts "#{current_player.name} wins!"
        if play_again?
          reset_game
        else
          game_is_on = false
        end
      elsif check_for_draw?
        puts 'It is a draw!'
        if play_again?
          reset_game
        else
          game_is_on = false
        end
      else
        @player_position += 1
      end
    end
  end

  def turn(current_player)
    # It takes the position from the make_choice method in the Player Class.
    # It keeps prompting if the update_position method in the Gameboard Class does not return True
    position = current_player.make_choice
    until @gameboard.check_position?(position) == true
      puts 'Position not valid'
      position = current_player.make_choice
    end
    @gameboard.update_position(current_player.symbol, position)
    @gameboard.display_gameboard
  end

  def check_winner?(current_player)
    return true if check_rows?(current_player)
    return true if check_columns?(current_player)
    return true if check_diagonals?(current_player)

    false
  end

  def play_again?
    puts 'Play again? (y/n)'
    answer = gets.chomp.downcase
    until %w[y n].include?(answer)
      puts 'Play again?'
      answer = gets.chomp.downcase
    end
    return true if answer == 'y'

    false
  end

  def reset_game
    @gameboard = Gameboard.new
    @gameboard.display_gameboard
    @player_position = 0
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
    #  2 CONDITION: if all elements in a column are the same (X or O) return TRUE else return FALSE
    board = @gameboard.board.transpose
    board.each do |row|
      return true if row.all? { |element| element == current_player.symbol }
    end
    false
  end

  def check_diagonals?(current_player)
    #  3 CONDITION: if all elements in diagonal are the same (X or O) return TRUE else return FALSE
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
