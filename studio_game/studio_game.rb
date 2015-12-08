require 'securerandom'

class Player
attr_reader :health
attr_accessor :name

	def initialize (name=SecureRandom.urlsafe_base64(5), health=rand(200))
		@name = name.capitalize
		@health = health 
		@health=rand(200) if health.nil? == true 
	end

	def score
		@health + name.size
	end

	def to_s()
        	"I'm #{@name} with health #{@health} and an score of #{score} as of #{time}"
	end

	def blam()
		@health -= 10
		"#{@name} got blammed!"
	end

	def w00t()
		@health += 15
		"#{@name} got w00ted!"
	end

end

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

#my_game.print_players
#my_game.print_players("health")
#players.reject! do |player|
#	player.name.downcase == "curly"
#end
#players << Player.new("ShemP2")
#my_game.print_players
#my_game.import_players(players)
#my_game.print_players

finish_program
