require_relative 'auditable'

module StudioGame
	$loaded_nums=[1,1,2,5,6,6]
	class LoadedDie
		include Auditable
		attr_reader :number
		def roll
			@number=$loaded_nums.sample
			audit
			@number
		end
	end
end
