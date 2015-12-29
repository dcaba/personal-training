require_relative 'player'
require_relative 'treasure_trove'

describe Player do
	context "with auto health" do
		before do
			@player = Player.new("dani")
			@health = @player.health
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
		it "has a proper string representation" do
			@player.found_treasure(Treasure.new(:hammer, 50))
			@player.found_treasure(Treasure.new(:hammer, 50))
			expect(@player.to_s).to include "I'm Dani with health = #{@health}, points = 100, and score = #{@health+100}"
		end
		it "yields each found treasure and its total points" do
			@player.found_treasure(Treasure.new(:skillet, 100))
			@player.found_treasure(Treasure.new(:skillet, 100))
			@player.found_treasure(Treasure.new(:hammer, 50))
			@player.found_treasure(Treasure.new(:bottle, 5))
			@player.found_treasure(Treasure.new(:bottle, 5))
			@player.found_treasure(Treasure.new(:bottle, 5))
			@player.found_treasure(Treasure.new(:bottle, 5))
			@player.found_treasure(Treasure.new(:bottle, 5))

			yielded = []
			@player.each_found_treasure do |treasure|
				yielded << treasure
			end

			expect(yielded).to be == [
				Treasure.new(:skillet, 200),
				Treasure.new(:hammer, 50),
				Treasure.new(:bottle, 25)
			]
		end

	end
	context "with a high static health" do
		before do
			@initial_health=150
			@player = Player.new("dani",@initial_health)
		end
		it "computes a score as the sum of its health and points" do
			@player.found_treasure(Treasure.new(:hammer, 50))
			@player.found_treasure(Treasure.new(:hammer, 50))
			expect(@player.score).to be == @initial_health + 100 
		end

		it "increases health by 15 when w00ted" do
			@player.w00t
			expect(@player.health).to be == @initial_health+15
		end

		it "decreases health by 10 when blammed" do
			@player.blam
			expect(@player.health).to be == @initial_health-10
		end
		it "is strong" do
			expect(@player).to be_strong
		end
		it "computes points as the sum of all treasure points" do
			expect(@player.points).to be == 0

			@player.found_treasure(Treasure.new(:hammer, 50))

			expect(@player.points).to be == 50

			@player.found_treasure(Treasure.new(:crowbar, 400))

			expect(@player.points).to be == 450

			@player.found_treasure(Treasure.new(:hammer, 50))

			expect(@player.points).to be == 500
		end
	end
	context "with a low static health" do
		before do
			@initial_health=50
			@player = Player.new("dani",@initial_health)
		end

		it "is wimpy" do
			expect(@player).not_to be_strong
		end
	end
	context "in a collection of players" do
		before do
			@player1 = Player.new("moe", 100)
			@player2 = Player.new("larry", 200)
			@player3 = Player.new("curly", 300)

			@players = [@player1, @player2, @player3]
		end

		it "is sorted by decreasing score" do
			expect(@players.sort).to be == [@player3, @player2, @player1]
		end
	end
end
