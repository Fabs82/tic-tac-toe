# Classe che gestisce i due giocatori: prende un nome e il simbolo come argomenti
class Player
  attr_reader :symbol

  def initialize(name, symbol)
    @name = name
    @symbol = symbol
    puts "Player initialized - Name: #{@name} | Symbol: #{@symbol}"
  end

  def make_choice
    puts 'Please make your choice (a number  between 1 and 9)'
    position = gets.chomp.to_i
    until position.between?(1, 9)
      puts 'Position not valid. Please make your choice (a number  between 1 and 9)'
      position = gets.chomp.to_i
    end
    puts "#{@name} chose #{position}"
    position
  end
end

player_one = Player.new('Fabio', 'X')
player_two = Player.new('Biagio', 'O')
player_one.make_choice
player_two.make_choice
