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

	it "also introduces the changes properly in a multiround game" do
		allow_any_instance_of(Die).to receive(:roll).and_return(5)
		@game.play 2
		allow_any_instance_of(Die).to receive(:roll).and_return(1)
		@game.play 2
		allow_any_instance_of(Die).to receive(:roll).and_return(3)
		@game.play 4
		tested_player = @game.get_player_by_name("moe")
		expect(tested_player.health).to be == @initial_health + 15*2 - 10*2
	end
	it "assigns a treasure for points during a player's turn" do
		game = Game.new("Knuckleheads")
		player = Player.new("moe")

		game.add_player(player)

		game.play(1)

		expect(player.points).not_to be_zero
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

		it "prints the status properly" do
			expected_stats="Tongo game Statistics:\n\n1 strong players:\n\tWinner.............. 2000\n\n1 wimpy players:\n\tLoser............... 1\n"
			expected_stats << "Tongo game High Scores:\n\tWinner.............. 2000\n\tLoser............... 1\n"
			expected_stats << "Tongo game Total points:\n\tWinner's point totals:\n\t\t0 grand total points\n\tLoser's point totals:\n\t\t0 grand total points\n"
			expect(@game.print_stats).to be == expected_stats
		end
	end

	context "from an imported array of players" do
		before do
			@players_data=[["larry",60],["curly",120],["moe",100],["shemp",90],["dani"]]
			players = Array.new
			@players_data.each do |name,health|
				player = Player.new(name,health)
				players << player
			end
			@game = Game.new "test game"
			@game.load_players(players)
		end
		it "should contain the expected number of players" do
			expect(@game.players.size).to be == @players_data.size
		end
	end

	context "from an imported csv of players" do
		before do
			@player_file="game_spec_players.csv"
			@game = Game.new("csv game")
			@game.load_players(@player_file)
		end
		it "should contain the expected number of players" do
			expect(@game.players.size).to be == `cat #{@player_file} | wc -l`.to_i
		end
	end



end
