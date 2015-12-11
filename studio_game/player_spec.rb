require_relative 'player'

describe Player do
	context "with auto health" do
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
	end
	context "with static health" do
		before do
			@initial_health=150
			@player = Player.new("dani",@initial_health)
		end

		it "computes a score as the sum of its health and length of name" do
			expect(@player.score).to be == "Dani".size + @initial_health 
		end

		it "increases health by 15 when w00ted" do
			@player.w00t
			expect(@player.health).to be == @initial_health+15
		end

		it "decreases health by 10 when blammed" do
			@player.blam
			expect(@player.health).to be == @initial_health-10
		end
	end
end
