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
		players.each do |player|
       			case player[0]
       			when "larry"
      				puts "\t #{player[0].capitalize} has a health of #{player[1]}."
       			when "curly"
               			puts "\t #{player[0].upcase} has a health of #{player[1]}."
			when "moe"
       				puts "\t "+"#{player[0].capitalize} has a health of #{player[1]}.".center(40,"*")
			when "shemp"
               			puts "\t #{player[0].capitalize.ljust(20,".")} health #{player[1]}."
       			else
       				puts "\t #{player[0]} \n"
       			end
		end 
	when "health" 
		puts "Health report"
	end
end


players_data=[["larry",60],["curly",120],["moe",100],["shemp",90],["dani"]]
print_players(players_data)

players = Array.new

players_data.each do |name,health|
	player = Player.new(name,health)
	players << player
	puts "player has been processed: #{player}"
	if (rand(1..2)==1)
	puts "---this user was lucky... time to play with it!"
		rand(1..10).times do
			case rand(1..2)
				when 1
				 puts player.blam 
				else
				 puts player.w00t
			end
		end
	end
end

puts "Players have been parsed. There are #{players.size} players in the game"

players.each do |player|
	puts player
end
