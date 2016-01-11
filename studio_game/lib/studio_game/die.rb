require_relative 'auditable.rb'

module StudioGame
	class Die
		include Auditable
		attr_reader :number
		def initialize
			roll
		end
		def roll
			@number=rand(5)+1
			audit
			return @number
		end
	end
end
