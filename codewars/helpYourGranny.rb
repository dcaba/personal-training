require_relative 'framework'

def tour(friends, fTowns, distTable)
	total_distance = 0
	previous_distance = nil
	friends.each do |friend|
		town_pair = fTowns.select { |pair| pair.first == friend}.first
		next if town_pair.nil?
		distance_from_X0 = distTable[town_pair.last]
		total_distance += previous_distance.nil? ? distance_from_X0 : (distance_from_X0**2 - previous_distance**2)**0.5
		previous_distance = distance_from_X0
	end
	return (total_distance + previous_distance).to_i
end

friends1 = ["A1", "A2", "A3", "A4", "A5"]
fTowns1 = [["A1", "X1"], ["A2", "X2"], ["A3", "X3"], ["A4", "X4"]]
distTable1 = Hash["X1", 100.0, "X2", 200.0, "X3", 250.0, "X4", 300.0]
Test.assert_equals(tour(friends1, fTowns1, distTable1), 889)
