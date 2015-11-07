require_relative "treasure_trove"

describe "Treasure" do
  before do
    @treasure = Treasure.new(:hammer, 50)
  end
  
  it "has a name attribute" do
    expect(@treasure.name).to eq(:hammer)
  end
  
  it "has a points attribute" do
    expect(@treasure.points).to eq(50)
  end
end

describe "Treasure Trove" do
  before do
    @game_treasures = TreasureTrove::TREASURES
  end
  it "should contain 6 treasure items" do
    expect(@game_treasures.size).to eq(6)
  end
  
  it "should have pie to equal 5 points" do
    expect(@game_treasures[0].points).to eq(5)
  end
  
  it "should have bottle to equal 25 points" do
    expect(@game_treasures[1].points).to eq(25)
  end
  
  it "should have hammer to equal 50 points" do
    expect(@game_treasures[2].points).to eq(50)
  end

  it "should have skillet to equal 100 points" do
    expect(@game_treasures[3].points).to eq(100)
  end
  it "should have broomstick to equal 200 points" do
    expect(@game_treasures[4].points).to eq(200)
  end
  it "should have crowbar to equal 200 points" do
    expect(@game_treasures[5].points).to eq(200)
  end
  it "returns a random treasure" do
    treasure = TreasureTrove.random
    expect(TreasureTrove::TREASURES).to include(treasure)
  end
end