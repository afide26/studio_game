require_relative 'player'

describe Player do
  
  before do
		@initial_health = 60
		@player = Player.new("larry", 60)
  end
  
	it "has capitalized player name" do
		expect(@player.name).to eq("Larry")
	end

	it "should have an initial health" do
		expect(@player.health).to eq(60)
	end

	it "should have a string representation" do
		expect(@player.to_s).to eq "I'm Larry with a health rating of 60 and a score of 65."
	end

	it "should increase health rating by 15 when w00ted" do
		@player.w00t
		expect(@player.health).to eq(@initial_health+15)
	end

	it "should decrease health rating by 10 when blammed!" do
		@player.blam
		expect(@player.health).to be(@initial_health - 10)
	end

  context "should have an initial health rating" do
  	before do
  		@player = Player.new("larry")
  	end

  	it "should show the health rating to be 100" do
  		expect(@player.health).to eq(100)
  	end
  end

end