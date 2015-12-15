require_relative 'player'
require_relative 'game'

def initialize_program
	$init_time = Time.now	
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
	bye_message="Game finished at #{time}"
	puts "".center(80,"#")
	puts bye_message.center(80,"#")
	puts "".center(80,"#")
	puts "EXECUTION TIME: #{((Time.now - $init_time)*1000000).to_i} micro-seconds"
end

def time
	Time.now.strftime "%H:%M:%S"
end

#
# MAIN
#
players = initialize_program

# GAME 1
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

puts "The winner of #{my_game.title} was... #{my_game.winner}".center(160,"*")

# GAME 2
my_game2 = Game.new "Game with tens of players"

puts "Adding random players"
rand(50..150).times do
	my_game2.add_player
end
puts "Done"

puts "Game title: #{my_game2.title}"
my_game2.print_players
my_game2.play rand(1..5)
puts "The winner of #{my_game2.title} was... #{my_game2.winner}".center(160,"*")

finish_program
