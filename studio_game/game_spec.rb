require_relative 'game'
require_relative 'player'
require_relative 'die'

describe Game do

	before do
		$stdout = StringIO.new 
		@game = Game.new("Knuckleheads")

		@initial_health = 100
		@tested_player_name = "moe"
		@game.add_player
		@game.add_player(Player.new(@tested_player_name, @initial_health))
		@game.add_player
	end

	it "contains the expected player" do
		expect(@game.get_player_by_name("moe").name).to be == "Moe"
	end

	it "increases the health when rolling a high number" do
		allow_any_instance_of(Die).to receive(:roll).and_return(5)
		@game.play
		tested_player = @game.get_player_by_name("moe")
		expect(tested_player.health).to be == @initial_health + 15
	end

	it "decreases the health when rolling low number" do
		allow_any_instance_of(Die).to receive(:roll).and_return(2)
		@game.play
		tested_player = @game.get_player_by_name("moe")
		expect(tested_player.health).to be == @initial_health - 10 
	end
	it "keeps the health when rolling a mid number" do
		allow_any_instance_of(Die).to receive(:roll).and_return(4)
		@game.play
		tested_player = @game.get_player_by_name("moe")
		expect(tested_player.health).to be == @initial_health 
	end

	context "with an strong and wimpy player" do
		before do
			@game = Game.new("Tongo game")
			@game.add_player(Player.new("Winner", 2000))
			@game.add_player(Player.new("Loser", 1))
		end

		it "prints the winner properly" do
			expect(@game.winner.name.downcase).to be == "winner"
		end
	end


end
