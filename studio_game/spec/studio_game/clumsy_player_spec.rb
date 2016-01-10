require_relative 'clumsy_player'

module StudioGame
	describe ClumsyPlayer do
		before do
			@player = ClumsyPlayer.new("klutz")
			$stdout = StringIO.new
		end

		it "only gets half the point value for each treasure" do
			expect(@player.points).to be == 0

			hammer = Treasure.new(:hammer, 50)
			3.times { @player.found_treasure(hammer) }

			expect(@player.points).to be == 75

			crowbar = Treasure.new(:crowbar, 400)
			@player.found_treasure(crowbar)

			expect(@player.points).to be == 275    

			yielded = []
			@player.each_found_treasure do |treasure|
				yielded << treasure
			end

			expect(yielded).to be == [Treasure.new(:hammer, 75), Treasure.new(:crowbar, 200)]    
		end

	end
end
