require_relative 'player'
class Game
	def initialize(name)
		@name = name
		@players = []
	end

	def add_player(player)
		@players << player
	end

	def play
		puts "-".ljust(50, "-")
		puts "There are #{@players.size} players in #{@name.capitalize}:"
		@players.each do |player|
			puts player
		end
		puts "-".ljust(50, "-")
		@players.each do |player|
			player.w00t
			player.blam
			puts player
			puts "-".ljust(50, "-")
		end
	end
end