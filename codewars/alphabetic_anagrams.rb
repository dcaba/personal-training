# https://www.codewars.com/kata/alphabetic-anagrams/train/ruby

def create_opt_combinations(letters)
	# input is an array of ordered letters
	# output is an array of ordered unique permutations 
	return letters if letters.length == 1
	output = []
	letters.each do |letter|
		puts "processing: #{letter.inspect}"
		puts "current array: #{letters.inspect}"
		output << create_opt_combinations(letters.shift).map {|combination| combination.unshift(letter)}
	end
	return output
	
end
		

def create_combinations(word)
	return word.split("").permutation.to_a.sort!.uniq.map! {|elem| elem.join() }

end

def listPosition(word)
	combinations = create_combinations(word)
	#letters = word.split("").sort!
	#create_opt_combinations(letters)
	return combinations.index(word) + 1
end
