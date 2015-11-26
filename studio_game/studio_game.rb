require 'securerandom'

class Player

	def initialize (name=SecureRandom.urlsafe_base64(5), health=rand(200))
		@name = name.capitalize
		@health = health 
		@health=rand(200) if health.nil? == true 
	end

	def say_hello()
        	"I'm #{@name} with health #{@health} as of #{time}"
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

players.each do |player,health|
	player = Player.new(player,health)
	puts player.say_hello 
	puts player.inspect
end

player1 = Player.new
puts player1.inspect

