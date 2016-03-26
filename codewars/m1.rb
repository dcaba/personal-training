def decodeMorse(morseCode)
	response = String.new
	partial_word = String.new
	array = morseCode.split("")
	while array.size > 0 do
		char = array.shift
		if char == " "
			puts partial_word + " sent"
			partial_word = String.new
		else
			partial_word << char
			puts partial_word+" has increased"
		end
	end
	return response
end

puts decodeMorse('.... . -.--   .--- ..- -.. .')
