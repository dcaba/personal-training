require_relative 'player'
require_relative 'clumsy_player'
require_relative 'berserk_player'
require_relative 'game'

def play_user_rounds(csv_param)
	loop do
		puts "How many game rounds? ('quit' to exit)"
		answer = gets.chomp.downcase
		case answer
		when /^\d+$/
			rounds = answer.to_i
			$games << game1(rounds)
		       	$games << game2(rounds)
			$games << game3(rounds,csv_param)
		when "quit","exit","q"
			break
		else
			puts "Please enter a number or 'quit'"
		end

	end
end

def initialize_program(csv_param)
	$init_time = Time.now	
	csv_param << (ARGV.shift || "players.csv")
	$games = Array.new
	welcome_message="Game starting at #{time} - invoked with #{csv_param}"
	puts "".center(80,"#")
	puts welcome_message.center(80,"#")
	puts "".center(80,"#")
end


def finish_program
	bye_message="Game finished at #{time}...saving stats"
	puts "".center(80,"#")
	puts bye_message.center(80,"#")
	puts "".center(80,"#")
	$games.each {|game| game.save_high_scores "#{game.title}.out"}
	puts "stats saved"
	puts "EXECUTION TIME: #{((Time.now - $init_time)*1000000).to_i} micro-seconds"
end

def time
	Time.now.strftime "%H:%M:%S"
end

def game1_players
	players_data=[["larry",60],["curly",120],["moe",100],["shemp",90],["dani"]]
	players = Array.new

	players_data.each do |name,health|
		player = Player.new(name,health)
		players << player
		puts "player has been processed: #{player}"
	end
	return players
end

def game1(rounds=1)
	my_game = Game.new "myGame!"
	players = game1_players
	my_game.load_players(players)
	puts "Players have been imported. There are #{my_game.players.size} players in the game"

	puts "Adding a random player"
	my_game.add_player(Player.new)
	puts "Done"

	puts "Game title: #{my_game.title}"
	my_game.print_players
	my_game.print_players("health")

	my_game.play rounds

	puts "The winner of #{my_game.title} was... #{my_game.winner}".center(160,"*")
	return my_game
end

def game2(rounds=1)
	my_game2 = Game.new "Game with tens of players"

	puts "Adding random players"
	rand(50..150).times do
		my_game2.add_player
	end
	rand(1..10).times { |time| my_game2.add_player(ClumsyPlayer.new("-#{time}")) }
	rand(1..10).times { |time| my_game2.add_player(BerserkPlayer.new("+#{time}")) }
	puts ".. Done"

	puts "Game title: #{my_game2.title}"
	my_game2.print_players
	my_game2.play rounds
	puts "The winner of #{my_game2.title} was... #{my_game2.winner}".center(160,"*")
	return my_game2
end

def game3(rounds=1,player_file)
	my_game = Game.new "csv game!"
	my_game.load_players(player_file)
	my_game.add_player(ClumsyPlayer.new("-clumsy"))
	my_game.add_player(BerserkPlayer.new("+berserk"))
	puts "Players have been imported. There are #{my_game.players.size} players in the game"

	puts "Game title: #{my_game.title}"
	my_game.print_players

	my_game.play rounds

	puts "The winner of #{my_game.title} was... #{my_game.winner}".center(160,"*")
	return my_game
end

#
# MAIN
#
csv_param = String.new
initialize_program(csv_param)
play_user_rounds(csv_param)
finish_program
