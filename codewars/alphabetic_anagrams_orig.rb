require_relative 'framework'

def generate_letter_scores(word)
	scores = Hash.new	
	word.chars.uniq.sort.each_with_index { |letter,pos| scores[letter]= pos }
	return scores
end

def generate_letter_map(word)
	result = Hash.new(0)
	word.chars.each { |letter| result[letter] += 1 }
	return result
end

def generate_weighted_decisions(word, letter_scores, letter_map)
	result = []
	word.chars.each do |letter|
		next if letter_map.select {|key, value| value > 0}.keys.length < 2 
		result << letter_scores[letter]
		letter_map[letter] -= 1
	end
	return result
end

def calculate_position(decisions)
	position = 1 # first until we find wrong decisions
	decisions.each_with_index do |digit,i|
		position += digit * 2**i
	end
	return position
end

def listPosition(word)
	puts "###################"
	puts "word: #{word}"
	letter_scores = generate_letter_scores(word)
	letter_map = generate_letter_map(word)
	weighted_decisions = generate_weighted_decisions(word, letter_scores, letter_map)
	#weighted_decisions.each { |letter| print letter.to_s }
	#puts
	position = calculate_position(weighted_decisions)
	puts "position: " + position.to_s
	puts "###################"
	return position
end

Test.describe('Anagram') do
	Test.it('Must return appropriate values for known inputs') do
		testValues = {'A' => 1, 'ABAB' => 2, 'AAAB' => 1, 'BAAA' => 4, 'QUESTION' => 24572, 'BOOKKEEPER' => 10743}
		testValues.each do |key,value|
			Test.assert_equals(listPosition(key), value, 'Incorrect list position for: ' + key)
		end
	end
end
