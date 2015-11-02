class Player
	attr_accessor :name
	attr_accessor :health

	def initialize(name, health=100)
		@name = name. capitalize
		@health = health
	end

	def w00t
		@health +=15
		puts "#{@name} got w00ted!"
	end

	def blam
		@health -=10
		puts "#{@name} got blammed!"
	end

	def score
		@name.length+health
	end

	def to_s
		"I'm #{@name.capitalize} with a health rating of #{@health} and a score of #{score}."
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
