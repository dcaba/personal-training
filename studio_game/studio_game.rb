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


players=[["larry",60],["curly",120],["moe",100],["shemp",90]]

puts "Players: \n"
print_players(players)

puts "Modifyig health..."
players[1][1]=players[0][1]
puts "Modified PLayers:"
print_players(players)

puts "Modifying Larry's health"
players[0][1]=10
puts "New modified players:"
print_players(players)
