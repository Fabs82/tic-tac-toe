require 'ruby2d'

# A class that draws the gameboard and handles the players click
class GuiGameboard
  def initialize(match_instance)
    @match_instance = match_instance
    @message = Text.new('', x: 120, y: 450, size: 20, color: 'white')
    @turn_number_message = Text.new('GAME 1 - TURN 1 - Player 1', x: 105, y: 25, size: 20, color: 'white')
    @endgame_message = Text.new('', x: 190, y: 450, size: 20, color: 'green')
    Window.set(
      title: 'Tic Tac Toe',
      background: 'navy',
      height: 500,
      width: 500
    )

    @orizontal_one = Line.new(
      x1: 100, y1: 200,
      x2: 400, y2: 200,
      width: 2,
      color: 'white'
    )

    @orizontal_two = Line.new(
      x1: 100, y1: 300,
      x2: 400, y2: 300,
      width: 2,
      color: 'white'
    )

    @vertical_one = Line.new(
      x1: 200, y1: 100,
      x2: 200, y2: 400,
      width: 2,
      color: 'white'
    )

    @vertical_two = Line.new(
      x1: 300, y1: 100,
      x2: 300, y2: 400,
      width: 2,
      color: 'white'
    )
  end

  def match_instance_setting(match_instance)
    @match_instance = match_instance
  end

  def handle_click(event_x, event_y)
    # the logic to check the x-y coordinates against the cells cooridnates and return a 1 to 9 number.
    if event_x.between?(100, 200) && event_y.between?(100, 200)
      cell_number = 1
    elsif event_x.between?(200, 300) && event_y.between?(100, 200)
      cell_number = 2
    elsif event_x.between?(300, 400) && event_y.between?(100, 200)
      cell_number = 3
    elsif event_x.between?(100, 200) && event_y.between?(200, 300)
      cell_number = 4
    elsif event_x.between?(200, 300) && event_y.between?(200, 300)
      cell_number = 5
    elsif event_x.between?(300, 400) && event_y.between?(200, 300)
      cell_number = 6
    elsif event_x.between?(100, 200) && event_y.between?(300, 400)
      cell_number = 7
    elsif event_x.between?(200, 300) && event_y.between?(300, 400)
      cell_number = 8
    elsif event_x.between?(300, 400) && event_y.between?(300, 400)
      cell_number = 9
    else
      @message.text = 'Out of bound. Choose again'
      return
    end
    @message.text = ''
    @match_instance.process_player_choice(cell_number)
  end

  def draw_symbol(cell_number, symbol)
    color = if symbol == 'X'
              'red'
            else
              'yellow'
            end
    case cell_number
    when 1
      Text.new(symbol, x: 132, y: 115, size: 50, color: color)
    when 2
      Text.new(symbol, x: 232, y: 115, size: 50, color: color)
    when 3
      Text.new(symbol, x: 332, y: 115, size: 50, color: color)
    when 4
      Text.new(symbol, x: 132, y: 215, size: 50, color: color)
    when 5
      Text.new(symbol, x: 232, y: 215, size: 50, color: color)
    when 6
      Text.new(symbol, x: 332, y: 215, size: 50, color: color)
    when 7
      Text.new(symbol, x: 132, y: 315, size: 50, color: color)
    when 8
      Text.new(symbol, x: 232, y: 315, size: 50, color: color)
    when 9
      Text.new(symbol, x: 332, y: 315, size: 50, color: color)
    end
  end

  def turn_number(match_number, turn_number, player_name)
    @turn_number_message.text = "GAME #{match_number} - TURN #{turn_number} - #{player_name}"
  end

  def declare_winner(player_name)
    @endgame_message.text = "#{player_name} won"
  end

  def declare_draw
    @endgame_message.text = "It's a draw!"
  end
end
