require_relative 'player'
class Game
	attr_accessor :players,:title

	def initialize(name)
		@title = name
		@players = Array.new
	end

	def add_player(player)
		@players << player
	end

	def import_players(players_import)
		@players = players_import.clone
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

	def play
		puts "Now we are playing with #{title} and #{players.size} players".center(80,"*")
		@players.each do |player|
			if (rand(1..2)==1)
				puts "-user #{player.name} was lucky... time to play with it!"
				puts "-Before playing: #{player}"
				rand(1..10).times do
					case rand(1..2)
					when 1
						puts "\t"+player.blam
					else
						puts "\t"+player.w00t
					end
				end
				puts "-After playing: #{player}"
			end
		end
	end

end

if __FILE__ == $0
	puts "Executing this class"
	test_game = Game.new("test Game")
	test_game.play
	test_game.add_player(Player.new)
	test_game.play
end
