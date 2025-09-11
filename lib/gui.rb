require 'ruby2d'

# A class that draws the gameboard and handles the players click
class GuiGameboard
  def initialize
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

  def handle_click(event_x, event_y)
    puts event_x, event_y
    # here the logic to check the x-y coordinates against the cells cooridnates and return a 1 to 9 number.
  end
end

gui = GuiGameboard.new

on :mouse_down do |event|
  gui.handle_click(event.x, event.y)
end

show
