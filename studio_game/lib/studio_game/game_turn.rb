require_relative 'die'
#require_relative 'loaded_die'
require_relative 'player'
require_relative 'treasure_trove'

module StudioGame
	module GameTurn
		def self.take_turn(player)
			die = Die.new
			case die.roll
			when 1..2
				puts "\t"+player.blam
			when 5..6
				puts "\t"+player.w00t
			else
				puts "\tPlayer #{player.name} skipped"
			end
			treasure_mgmt(player)
		end
		def self.treasure_mgmt(player)
			found_treasure = TreasureTrove::random
			player.found_treasure(found_treasure)
		end
	end
end
