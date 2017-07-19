Test.describe('Anagram') do
	Test.it('Must return appropriate values for known inputs') do
		#testValues = {'A' => 1, 'ABAB' => 2, 'AAAB' => 1, 'BAAA' => 4, 'QUESTION' => 24572, 'BOOKKEEPER' => 10743}
		testValues = {'A' => 1, 'ABAB' => 2, 'AAAB' => 1, 'BAAA' => 4, 'QUESTION' => 24572}
		testValues.each do |key,value|
			Test.assert_equals(listPosition(key), value, 'Incorrect list position for: ' + key)
		end
	end
end
