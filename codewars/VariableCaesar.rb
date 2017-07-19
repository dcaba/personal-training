require_relative 'framework.rb'

def shift_char(char, shift)
	case char
	when "A".."Z"
		base = "A".codepoints.first
	when "a".."z"
		base = "a".codepoints.first
	else 
		return char
	end
	return ((char.codepoints.first - base + shift).modulo(("A".."Z").to_a.length) + base).chr
end
def calc_break(total_size)
	slot_size = total_size / 5 
	if total_size.modulo(5) != 0
		slot_size += 1 if (slot_size+1)*4 <= total_size
	end
	return slot_size
end
def generate_packed_response(message)
	response = []
	first_four_size = calc_break(message.length)
	4.times do |packet|
		response << message[packet*first_four_size..(packet+1)*first_four_size-1].join
	end
	response << message[4*first_four_size..-1].join
	return response
end

def movingShift(s, shift, reverse=false)
	response = []
	s.length.times do |position|
		final_shift = reverse ? shift-position : shift+position
		response << shift_char(s[position], final_shift)
	end
	return generate_packed_response(response)
end

def demovingShift(arr, shift)
	one_line_msg = arr.join
	return movingShift(one_line_msg, -shift, true).join

end

u = "I should have known that you would have a perfect answer for me!!!"
v = ["J vltasl rlhr ", "zdfog odxr ypw", " atasl rlhr p ", "gwkzzyq zntyhv", " lvz wp!!!"]

Test.assert_equals(movingShift(u, 1), v)
Test.assert_equals(demovingShift(v, 1), u)

w = " uoxIirmoveNreefckgieaoiEcooqo"
x = [" xscOp","zvygqA","ftuwud","adaxmh","Edqrut"]
Test.assert_equals(movingShift(w, 2), x)
Test.assert_equals(demovingShift(x, 2), w)
