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

if __FILE__ == $0
	player = Player.new("moe")
	puts player.name
	puts player.health
	player.w00t
	puts player.health
	player.blam
	puts player.health
end

