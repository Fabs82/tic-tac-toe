require_relative 'player'
require_relative 'gameboard'
require 'colorize'
# A class that manages the progression of the entire game by relying on the Gameboard and Player classes.
class Match
  attr_reader :game_over

  def initialize(gui)
    @gui = gui
    @gameboard = Gameboard.new
    @player_one = Player.new('Player 1', 'X')
    @player_two = Player.new('Player 2', 'O')
    @players = [@player_one, @player_two]
    @player_position = 0
    @match_number = 0
    @score_p_one = 0
    @score_p_two = 0
    @game_over = false
  end

  def process_player_choice(cell_number)
    current_player = @players[@player_position % 2]
    symbol = current_player.symbol
    if @gameboard.check_position?(cell_number)
      @gameboard.update_position(symbol, cell_number)
      @gui.draw_symbol(cell_number, symbol)
      @player_position += 1
    end
    if check_winner?(current_player)
      @gui.declare_winner(current_player.name)
      if current_player.name == 'Player 1'
        @gui.change_score(@score_p_one += 1, @score_p_two)
      elsif current_player.name == 'Player 2'
        @gui.change_score(@score_p_one, @score_p_two += 1)
      end
      @game_over = true
      @gui.play_again_message
    elsif check_for_draw?
      @gui.declare_draw
      @game_over = true
      @gui.play_again_message
    end
    next_player = @players[@player_position % 2]
    @gui.turn_number(@match_number + 1, @player_position + 1, next_player.name)
  end

  def check_winner?(current_player)
    return true if check_rows?(current_player)
    return true if check_columns?(current_player)
    return true if check_diagonals?(current_player)

    false
  end

  def reset_game
    @gameboard = Gameboard.new
    @player_position = 0
    @match_number += 1
    @game_over = false
    initial_player = @players[@player_position % 2]
    @gui.turn_number(@match_number + 1, @player_position + 1, initial_player.name)
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

  def handle_play_again(player_answer)
    if player_answer == 'y'
      reset_game
      # update the gui board
      @gui.clear_board
    elsif player_answer == 'n'
      Window.close
    end
  end
end
