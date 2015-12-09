require_relative 'player'

describe Player do
	before do
		@player = Player.new("dani")
	end

	it "has a capitalized name" do
		expect(@player.name).to be == "Dani"
	end

	it "has an initial health" do
		expect(@player.health).to be > 0
	end

	it "has a string representation" do
		expect(@player.to_s).not_to be nil
	end

	it "computes a score as the sum of its health and length of name" do
		expect(@player.score).to be == "Dani".size + @player.health 
	end

	it "increases health by 15 when w00ted"

	it "decreases health by 10 when blammed"

end

