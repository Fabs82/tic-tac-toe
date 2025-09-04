# Classe che gestisce i due giocatori: prende un nome e il simbolo come argomenti
class Player
  attr_reader :symbol, :name

  def initialize(name, symbol)
    @name = name
    @symbol = symbol
    puts "Ready #{@name} | Symbol: #{@symbol}"
  end

  def make_choice
    # metodo che chiede al giocatore un numero obbligatoriamente da 1 a 9
    puts "Please #{@name}, make your choice (a number between 1 and 9)"
    position = gets.chomp.to_i
    until position.between?(1, 9)
      puts 'The number entered is not valid. Please make your choice (a number between 1 and 9)'
      position = gets.chomp.to_i
    end
    position
  end
end

# test per controllo funzionalità
# player_one = Player.new('Fabio', 'X')
# player_two = Player.new('Biagio', 'O')
# player_one.make_choice
# player_two.make_choice
