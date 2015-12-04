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

def time
	Time.now.strftime "%H:%M:%S" 
end


def print_players(players,scope="all") 
	case scope
	when "all"
		puts "*************"
		puts "Players information"
		puts "*************"
		players.each do |player|
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
		puts "*************"
		puts "Health report"
		puts "*************"
		players.each do |player|
			puts player.health
		end
	end
end

def play(players)
players.each do |player|
        if (rand(1..2)==1)
	        puts "---user #{player.name} was lucky... time to play with it!"
		puts "Before playing: #{player}"
                rand(1..10).times do
                        case rand(1..2)
                                when 1
                                 puts player.blam
                                else
                                 puts player.w00t
                        end
                end
		puts "After playing: #{player}"
        end
end
end


players_data=[["larry",60],["curly",120],["moe",100],["shemp",90],["dani"]]
players = Array.new

players_data.each do |name,health|
	player = Player.new(name,health)
	players << player
	puts "player has been processed: #{player}"
end
puts "Players have been imported. There are #{players.size} players in the game"

print_players(players)
print_players(players,"health")

play(players)

print_players(players)
print_players(players,"health")

players.reject! do |player|
	player.name.downcase == "curly"
end

players << Player.new("ShemP2")

print_players(players)
