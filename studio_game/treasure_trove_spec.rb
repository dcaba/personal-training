require_relative 'treasure_trove'

describe Treasure do

	before do
		@treasure = Treasure.new(:hammer, 50)
	end

	it "has a name attribute" do
		expect(@treasure.name).to be == :hammer
	end

	it "has a points attribute" do
		expect(@treasure.points).to be == 50
	end

end

describe TreasureTrove do

	it "has six treasures" do
		expect(TreasureTrove::TREASURES.size).to be == 6
	end

	it "has a pie worth 5 points" do
		expect(TreasureTrove::TREASURES[0]).to be == Treasure.new(:pie, 5)
	end

	it "has a bottle worth 25 points" do
		expect(TreasureTrove::TREASURES[1]).to be == Treasure.new(:bottle, 25)
	end

	it "has a hammer worth 50 points" do
		expect(TreasureTrove::TREASURES[2]).to be == Treasure.new(:hammer, 50)
	end

	it "has a skillet worth 100 points" do
		expect(TreasureTrove::TREASURES[3]).to be == Treasure.new(:skillet, 100)
	end

	it "has a broomstick worth 200 points" do
		expect(TreasureTrove::TREASURES[4]).to be == Treasure.new(:broomstick, 200)
	end

	it "has a crowbar worth 400 points" do
		expect(TreasureTrove::TREASURES[5]).to be == Treasure.new(:crowbar, 400)
	end

	it "returns a random treasure" do
		treasure = TreasureTrove.random
		expect(TreasureTrove::TREASURES).to include(treasure)
	end

end
