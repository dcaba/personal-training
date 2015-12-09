require_relative 'player'

describe Player do
	before do
		@player = Player.new("dani")
	end

	it "has a capitalized name" do
		expect(@player.name).to eq("Dani")
	end

end

