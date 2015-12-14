require_relative 'die'
require_relative 'player'

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
	end
end

