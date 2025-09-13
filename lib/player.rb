# A class that manages the two players: it takes a name and a symbol as arguments.
class Player
  attr_reader :symbol, :name

  def initialize(name, symbol)
    @name = name
    @symbol = symbol
    # puts "Ready #{@name} | Symbol: #{@symbol}"
  end
end

#   def make_choice
#     # A method that requires the player to enter a number, which must be between 1 and 9.
#     puts "Please #{@name}, make your choice (a number between 1 and 9)"
#     position = gets.chomp.to_i
#     until position.between?(1, 9)
#       puts 'The number entered is not valid. Please make your choice (a number between 1 and 9)'
#       position = gets.chomp.to_i
#     end
#     position
#   end
