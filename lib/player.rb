require_relative 'treasure_trove'
require_relative 'playable'
class Player
  include Playable
	attr_accessor :name
	attr_accessor :health

	def initialize(name, health=100)
		@name = name. capitalize
		@health = health.to_i
    @found_treasures = Hash.new(0)
	end
  
  def points
    @found_treasures.values.inject(0, :+)
  end
  
  def self.from_csv(string)
    name, health = string.split(',')
    Player.new(name, Integer(health))
  end
  
  def found_treasure(treasure)
    @found_treasures[treasure.name] += treasure.points.to_i
    puts "#{@name} found a #{treasure.name} treasure worth #{treasure.points} points."
  end
  
  def each_found_treasure 
    @found_treasures.each do |name, points|
      yield Treasure.new(name, points)
    end
  end

	def to_s
		"I'm #{@name.capitalize} with health = #{@health.to_i}, points = #{points.to_i}, and a score = #{score.to_i}."
	end
end

if __FILE__ == $0
	player = Player.new("moe")
	puts player.name
	puts player.health
	puts "-".ljust(50,"-")
	player.w00t
	puts player.health
	puts "-".ljust(50,"-")
	player.blam
	puts player.health
end
