require_relative 'player'

BERSERK_THRESHOLD = 5

class BerserkPlayer < Player
	def initialize(name,health=100)
		@w00t_count=0
		super(name,health)	       
	end
	def berserk?
		return @w00t_count > BERSERK_THRESHOLD
	end
	def w00t
		@w00t_count += 1
		puts "#{@name} becaming berserk!!!!" if @w00t_count == BERSERK_THRESHOLD+1
		super
	end
	def blam
		berserk? ? w00t : super	
	end
end
if __FILE__ == $0
	berserker = BerserkPlayer.new("berserker", 50)
	6.times { berserker.w00t }
	2.times { berserker.blam }
	puts berserker.health
end
