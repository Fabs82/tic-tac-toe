require_relative 'lib/gui'
require_relative 'lib/match'

gui = GuiGameboard.new(nil)

match = Match.new(gui)
gui.match_instance_setting(match)
on :mouse_down do |event|
  gui.handle_click(event.x, event.y)
end

show
