require_relative 'player'
require_relative 'game_turn'
require_relative 'treasure_trove'

class Game
	attr_accessor :players,:title

	def initialize(name)
		@title = name
		@players = Array.new
	end

	def add_player(player=Player.new)
		@players << player
	end

	def load_players(players_import)
		@players = players_import.clone
	end

	def get_player_by_name(name)
		players_with_name = @players.select {|player| player.name.downcase == name.downcase}
		players_with_name.first
	end

	def winner
		@players.sort {|x,y| y.score <=> x.score}.first 
	end

	def print_players(scope="all") 
		case scope
		when "all"
			puts "Players information".center(80,"*")
			@players.each do |player|
				case player.name.downcase
				when "larry"
					puts "\t #{player.name.capitalize} has a health of #{player.health}."
				when "curly"
					puts "\t #{player.name.upcase} has a health of #{player.health}."
				when "moe"
					puts "\t "+"#{player.name.capitalize} has a health of #{player.health}.".center(40,"*")
				when "shemp"
					puts "\t #{player.name.capitalize.ljust(20,".")} health #{player.health}."
				else
					puts "\t #{player.name} \n"
				end
			end 
		when "health" 
			puts "Health report".center(80,"*")
			@players.each do |player|
				puts "\t#{player.health}"
			end
		end
	end
	def print_player_health(player)
		"\t"+"#{player.name}".ljust(20,".")+" #{player.health}\n"
	end

	def print_player_score(player)
		"\t"+"#{player.name}".ljust(20,".")+" #{player.score}\n"
	end

	def report_strong_wimpy
		message="#{@title} Statistics:\n"
		strong,wimpy=@players.partition{|x| x.strong?}
		message << "\n#{strong.size} strong players:\n"
		strong.each {|player| message << print_player_health(player)}
		message << "\n#{wimpy.size} wimpy players:\n"
		wimpy.each {|player| message << print_player_health(player)}
		return message
	end
	def report_high_scores
		message="#{@title} High Scores:\n"
		players.sort.each {|player| message << print_player_score(player)}
		return message
	end
	def report_per_treasure_points(player)
		message = String.new
		player.each_found_treasure do |treasure|
			message << "#{treasure.name} total #{treasure.points} points\n"	
		end
		return message
	end
	def report_total_points
		message="#{@title} Total points:\n"
		@players.each { |player| 
			message << "\t#{player.name}'s point totals:\n"
			rptr = report_per_treasure_points(player)
			(rptr.lines.each { |line| message << "\t\t" + line}) unless rptr.size == 0
		  	message << "\t\t#{player.points} grand total points\n" 
		} 
		return message
	end

	def print_stats
		message = String.new
		message << report_strong_wimpy
		message << report_high_scores 
		message << report_total_points
		return message
	end

	def play(rounds=1)
		puts "Starting to play!".center(80,"*")+"\n"
		puts "Treasures recollection"
		treasures=TreasureTrove::TREASURES
		puts "Counting on the following #{treasures.size} treasures:"
		treasures.each {|treasure| puts "\t#{treasure}"}
		puts "Now we are playing with #{title} and #{players.size} players".center(80,"*")
		rounds.times do |round|
			puts "Round number: #{round+1}"
			@players.each do |player|
				puts "-Before playing: #{player}"
				GameTurn.take_turn(player)
				puts "-After playing: #{player}"
			end
		end
		puts print_stats
		puts "Play finished!".center(80,"*")+"\n"
	end

end

if __FILE__ == $0
	puts "Executing this class"
	test_game = Game.new("test Game")
	test_game.play
	test_game.add_player(Player.new)
	test_game.play
end
