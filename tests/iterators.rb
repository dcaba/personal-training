def conversation
	puts "Hello"
	yield
	puts "Goodbye"
end

conversation {puts "Good to meet you!"}

def n_times(n) 
	1.upto n do |time|
		yield time
	end
end


n_times 5 do |n|
	puts "#{n} situps"
	puts "#{n} pushups"
	puts "#{n} chinups"
end
