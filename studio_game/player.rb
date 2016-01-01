require 'securerandom'
require_relative 'treasure_trove'

class Player
	attr_reader :health
	attr_accessor :name

	def initialize (name=SecureRandom.urlsafe_base64(5), health=rand(1..200))
		@name = name.capitalize
		@health = health 
		@health=rand(200) if health.nil? == true 
		@found_treasures = Hash.new(0)
	end
	def self.from_csv(line)
		name,health=line.split(",")
		new(name,Integer(health))
	end

	def found_treasure(treasure)
		 @found_treasures[treasure.name] += treasure.points
		 puts "#{name} found a #{treasure}"
		 puts "#{name} treasures:#{@found_treasures}"
	end
	def each_found_treasure
		@found_treasures.each do |key,value|
			yield Treasure.new(key,value)
		end
	end

	def score
		@health + points
	end

	def to_s()
		"I'm #{@name} with health = #{@health}, points = #{points}, and score = #{score} as of #{time}"
	end

	def blam()
		@health -= 10
		"#{@name} got blammed!"
	end

	def w00t()
		@health += 15
		"#{@name} got w00ted!"
	end

	def strong?
		@health > 100
	end
	def <=>(x)
		x.score <=> score
	end
	def points
		@found_treasures.values.reduce(0,:+)
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

