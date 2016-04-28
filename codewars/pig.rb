def pig_it text
	words = text.split " "
	words.map! do |word|
		if word.downcase.gsub(/[^a-z0-9\s]/i, '') == "" 
			word
		else
			word[1..word.size] + word[0] + 'ay'
		end
	end
	words.join " "
end

puts pig_it "Test example !"
