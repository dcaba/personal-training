require_relative 'auditable.rb'

class Die
	include Auditable
	attr_reader :number
	def initialize
		roll
	end
	def roll
		@number=rand(1..6)
		audit
		return @number
	end
end

