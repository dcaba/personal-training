def time
	Time.now.strftime "%H:%M:%S" 
end

def say_hello(name,health=100)
	"I'm #{name.capitalize} with health #{health} as of #{time}"
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


players=[["larry",60],["curly",120],["moe",100],["shemp",90],"dani"]

players.each do |player,health|
	if !health.nil? then
		puts say_hello(player,health) 
	else 
		puts say_hello player 
	end
end
