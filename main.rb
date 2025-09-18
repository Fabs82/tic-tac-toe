require_relative 'lib/gui'
require_relative 'lib/match'

gui = GuiGameboard.new(nil)

match = Match.new(gui)
gui.match_instance_setting(match)
on :mouse_down do |event|
  gui.handle_click(event.x, event.y)
end

on :key_down do |event|
  # Only process the key if the game is over
  match.handle_play_again(event.key) if match.game_over
end

show
