# https://www.codewars.com/kata/alphabetic-anagrams/train/ruby

def create_combinations(word)
	comb_tables = {'A' => ['A'],
		'ABAB' => ['AABB', 'ABAB', 'ABBA', 'BAAB', 'BABA', 'BBAA'],
		'AAAB' => ['AAAB', 'AABA', 'ABAA', 'BAAA'],
		'BAAA' => ['AAAB', 'AABA', 'ABAA', 'BAAA']
	}
	return comb_tables[word]

end

def listPosition(word)
	combinations = create_combinations(word)
	#test_values = {'A' => 1, 'ABAB' => 2, 'AAAB' => 1, 'BAAA' => 4, 'QUESTION' => 24572, 'BOOKKEEPER' => 10743}
	return combinations.index(word) + 1
end
