require_relative 'player'
require_relative 'treasure_trove'

module StudioGame

	class ClumsyPlayer < Player
		def found_treasure(treasure)
			super Treasure.new(treasure.name,treasure.points/2.0)
		end
	end

	if __FILE__ == $0
		clumsy = ClumsyPlayer.new("klutz")  

		hammer = Treasure.new(:hammer, 50)
		clumsy.found_treasure(hammer)
		clumsy.found_treasure(hammer)
		clumsy.found_treasure(hammer)

		crowbar = Treasure.new(:crowbar, 400)
		clumsy.found_treasure(crowbar)

		clumsy.each_found_treasure do |treasure|
			puts "#{treasure.points} total #{treasure.name} points"
		end
		puts "#{clumsy.points} grand total points"
	end
end
