require_relative 'player'
require_relative 'gameboard'
require 'colorize'
# A class that manages the progression of the entire game by relying on the Gameboard and Player classes.
class Match
  def initialize(gui)
    @gui = gui
    @gameboard = Gameboard.new
    @player_one = Player.new('Player 1', 'X')
    @player_two = Player.new('Player 2', 'O')
    @players = [@player_one, @player_two]
    @player_position = 0
    @match_number = 0
  end

  def process_player_choice(cell_number)
    current_player = @players[@player_position % 2]
    symbol = current_player.symbol
    if @gameboard.check_position?(cell_number)
      @gameboard.update_position(symbol, cell_number)
      @gui.draw_symbol(cell_number, symbol)
      @player_position += 1
      next_player = @players[@player_position % 2]
      @gui.turn_number(@match_number + 1, @player_position + 1, next_player.name)
    end
    if check_winner?(current_player)
      puts "#{current_player.name} won"
    elsif check_for_draw?
      puts "It's a draw!"
    end
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
    @player_position = 0
    @match_number += 1
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
