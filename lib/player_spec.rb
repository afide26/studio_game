require_relative 'player'
require_relative 'treasure_trove'

describe Player do
  
  before do
		@initial_health = 60
		@player = Player.new("larry", @initial_health)
  end
  
	it "has capitalized player name" do
		expect(@player.name).to eq("Larry")
	end

	it "should have an initial health" do
		expect(@player.health).to eq(60)
	end

	it "should have a string representation" do
    @player.found_treasure(Treasure.new(hammer: 50))
    @player.found_treasure(Treasure.new(hammer: 50))

	  expect(@player.to_s).to eq"I'm Larry with health = 60, points = 0, and a score = 60."
	end

	it "should increase health rating by 15 when w00ted" do
		@player.w00t
		expect(@player.health).to eq(@initial_health+15)
	end

	it "should decrease health rating by 10 when blammed!" do
		@player.blam
		expect(@player.health).to be(@initial_health - 10)
	end
  
  it "computes points as the sum of all treasure points" do
    expect(@player.points).to eq(0)

    @player.found_treasure(Treasure.new(:hammer, 50))
    expect(@player.points).to eq(50)


    @player.found_treasure(Treasure.new(:crowbar, 400))
    expect(@player.points).to eq(450)
   

    @player.found_treasure(Treasure.new(:hammer, 50))
    expect(@player.points).to eq(500)

  end

  context "should have an initial health rating" do
  	before do
  		@player = Player.new("larry")
  	end

  	it "should show the health rating to be 100" do
  		expect(@player.health).to eq(100)
  	end
  end
  
  context "should say strong with health >100" do
    before do
      @player = Player.new("larry", 150)
    end
    
    it "should display strong when health is > 100" do
      expect(@player).to be_strong
    end
  end
  
  context "should say wimpy when health is <100 " do
    before do
      @player = Player.new("larry", 99)
    end
    
    it "should display wimpy when player health is >100" do
      expect(@player).not_to be_strong
    end
  end
  
  it "can be created from a CSV String" do
    player = Player.from_csv("larry, 150")
    expect(player.name).to eq("Larry")
    expect(player.health.to_i).to eq(150)
  end
  
  context "in a collection of players" do
    before do
      @player1 = Player.new("larry", 100)
      @player2 = Player.new("curly", 200)
      @player3 = Player.new("moe", 300)
      
      @players = [@player1, @player2, @player3]
    end
    
    it "should sort the players score in descending order" do
     expect(@players.sort).to eq([@player3, @player2, @player1])
    end
  end
    
  it "computes the score as the sum of the health + points" do
    @player.found_treasure(Treasure.new(:hammer, 50))
    @player.found_treasure(Treasure.new(:hammer, 50))

    expect(@player.score.to_i).to eq(160)
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
    expect(yielded).to eq [Treasure.new(:skillet,200),Treasure.new(:hammer,50), Treasure.new(:bottle,25)]
  end
end