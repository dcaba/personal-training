require_relative 'player'
require_relative 'game'

def initialize_program
	welcome_message="Game starting at #{time}"
	puts "".center(80,"#")
	puts welcome_message.center(80,"#")
	puts "".center(80,"#")

	players_data=[["larry",60],["curly",120],["moe",100],["shemp",90],["dani"]]
	players = Array.new

	players_data.each do |name,health|
		player = Player.new(name,health)
		players << player
		puts "player has been processed: #{player}"
	end
	return players
end


def finish_program
	welcome_message="Game finished at #{time}"
	puts "".center(80,"#")
	puts welcome_message.center(80,"#")
	puts "".center(80,"#")
end

def time
	Time.now.strftime "%H:%M:%S"
end

#
# MAIN
#
players = initialize_program

my_game = Game.new "myGame!"
my_game.import_players(players)
puts "Players have been imported. There are #{my_game.players.size} players in the game"

puts "Adding a random player"
my_game.add_player(Player.new)
puts "Done"

puts "Game title: #{my_game.title}"
my_game.print_players
my_game.print_players("health")

my_game.play

finish_program
