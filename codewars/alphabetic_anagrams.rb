# https://www.codewars.com/kata/alphabetic-anagrams/train/ruby

def create_combinations(word)
	result = Array[]
	word.split("").permutation.to_a.uniq.sort.each {|elem| result << elem.join() }
	return result

end

def listPosition(word)
	combinations = create_combinations(word)
	return combinations.index(word) + 1
end
