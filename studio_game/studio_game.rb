require 'securerandom'

class Player

	def initialize (name=SecureRandom.urlsafe_base64(5), health=rand(200))
		@name = name.capitalize
		@health = health 
		@health=rand(200) if health.nil? == true 
	end

	def to_s()
        	"I'm #{@name} with health #{@health} as of #{time}"
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


def print_players(players) 
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
end


players=[["larry",60],["curly",120],["moe",100],["shemp",90],["dani"]]

print_players(players)

players.each do |name,health|
	player = Player.new(name,health)
	puts player 
	if (rand(1..2)==1)
	puts "this user was lucky... time to play with it!"
		rand(1..10).times do
			case rand(1..2)
				when 1
				 puts player.blam 
				else
				 puts player.w00t
			end
		end
	puts player 
	end
end

player1 = Player.new
puts player1.inspect

