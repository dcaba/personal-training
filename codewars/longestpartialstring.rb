def longest_consec(strarr, k)
	partial_strings = []
	return "" if k <= 0 or k > strarr.length
	strarr.length.times do |i|
		partial_strings << strarr[i..i+k-1].join 
	end
	return partial_strings.max_by(&:length)
end
puts 'longest_consec(["zone", "abigail", "theta", "form", "libe", "zas"], 2) == "abigailtheta"'
puts longest_consec(["zone", "abigail", "theta", "form", "libe", "zas"], 2) == "abigailtheta"
puts longest_consec(["zone", "abigail", "theta", "form", "libe", "zas"], 2) 
puts "=================="

puts 'longest_consec(["ejjjjmmtthh", "zxxuueeg", "aanlljrrrxx", "dqqqaaabbb", "oocccffuucccjjjkkkjyyyeehh"], 1) == "oocccffuucccjjjkkkjyyyeehh"'
puts longest_consec(["ejjjjmmtthh", "zxxuueeg", "aanlljrrrxx", "dqqqaaabbb", "oocccffuucccjjjkkkjyyyeehh"], 1) == "oocccffuucccjjjkkkjyyyeehh"
puts longest_consec(["ejjjjmmtthh", "zxxuueeg", "aanlljrrrxx", "dqqqaaabbb", "oocccffuucccjjjkkkjyyyeehh"], 1) 
puts "=================="

puts 'longest_consec([], 3) == ""'
puts longest_consec([], 3) == ""
puts longest_consec([], 3) 
puts "=================="

puts 'longest_consec(["itvayloxrp","wkppqsztdkmvcuwvereiupccauycnjutlv","vweqilsfytihvrzlaodfixoyxvyuyvgpck"], 2) == "wkppqsztdkmvcuwvereiupccauycnjutlvvweqilsfytihvrzlaodfixoyxvyuyvgpck"'
puts longest_consec(["itvayloxrp","wkppqsztdkmvcuwvereiupccauycnjutlv","vweqilsfytihvrzlaodfixoyxvyuyvgpck"], 2) == "wkppqsztdkmvcuwvereiupccauycnjutlvvweqilsfytihvrzlaodfixoyxvyuyvgpck"
puts longest_consec(["itvayloxrp","wkppqsztdkmvcuwvereiupccauycnjutlv","vweqilsfytihvrzlaodfixoyxvyuyvgpck"], 2) 
puts "=================="

puts 'longest_consec(["wlwsasphmxx","owiaxujylentrklctozmymu","wpgozvxxiu"], 2) == "wlwsasphmxxowiaxujylentrklctozmymu"'
puts longest_consec(["wlwsasphmxx","owiaxujylentrklctozmymu","wpgozvxxiu"], 2) == "wlwsasphmxxowiaxujylentrklctozmymu"
puts longest_consec(["wlwsasphmxx","owiaxujylentrklctozmymu","wpgozvxxiu"], 2) 
puts "=================="

puts 'longest_consec(["zone", "abigail", "theta", "form", "libe", "zas"], -2) == ""'
puts longest_consec(["zone", "abigail", "theta", "form", "libe", "zas"], -2) == ""
puts longest_consec(["zone", "abigail", "theta", "form", "libe", "zas"], -2)
puts "=================="

#puts longest_consec(["it","wkppv","ixoyx", "3452", "zzzzzzzzzzzz"], 3) == "ixoyx3452zzzzzzzzzzzz"
#puts longest_consec(["it","wkppv","ixoyx", "3452", "zzzzzzzzzzzz"], 3) == "ixoyx3452zzzzzzzzzzzz"
#puts longest_consec(["it","wkppv","ixoyx", "3452", "zzzzzzzzzzzz"], 3) == "ixoyx3452zzzzzzzzzzzz"
#puts "=================="
#
puts 'longest_consec(["it","wkppv","ixoyx", "3452", "zzzzzzzzzzzz"], 15) == ""'
puts longest_consec(["it","wkppv","ixoyx", "3452", "zzzzzzzzzzzz"], 15) == ""
puts longest_consec(["it","wkppv","ixoyx", "3452", "zzzzzzzzzzzz"], 15) 
puts "=================="

#puts longest_consec(["it","wkppv","ixoyx", "3452", "zzzzzzzzzzzz"], 0) == ""
#puts longest_consec(["it","wkppv","ixoyx", "3452", "zzzzzzzzzzzz"], 0) == ""
#puts longest_consec(["it","wkppv","ixoyx", "3452", "zzzzzzzzzzzz"], 0) == ""
#puts "=================="

