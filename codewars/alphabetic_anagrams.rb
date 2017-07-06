# https://www.codewars.com/kata/alphabetic-anagrams/train/ruby

def create_combinations(word)
	return word.split("").permutation.to_a.sort!.uniq.map! {|elem| elem.join() }

end

def listPosition(word)
	combinations = create_combinations(word)
	return combinations.index(word) + 1
end
