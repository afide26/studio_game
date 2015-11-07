require_relative 'player'
require_relative 'die'
require_relative 'game_turn'
require_relative 'treasure_trove'
require_relative 'playable'

class Game
	def initialize(name)
		@name = name.capitalize
		@players = []
	end
  

	def add_player(player)
		@players << player
	end

  def load_players(from_file)
    File.readlines(from_file).each do |line|
     name, health = line.split(',')
     player = Player.new(name, Integer(health))
     add_player(player)
    end
  end
  
  def high_score_entry(player)
    name_format = player.name.ljust(30, '-')
    "#{name_format}#{player.score}"
  end
  
  def save_high_scores(to_file="high_scores.txt")
    @title = @name
    File.open(to_file, "w") do |file|
      file.puts "#{@title} High Scores:"
      sorted_players = @players.sort {|a,b| a.score <=>b.score}
      sorted_players.each do |p|
        file.puts high_score_entry(p)
      end
    end
  end

  
  def print_stats
    puts "\n#{@name}'s Statistics:"
    puts "-".ljust(65, '-')
    strong_players, wimpy_players = @players.partition {|player| player.strong?}
    
    puts "\nStrong Players' Statistics: (#{strong_players.size})"
    strong_players.each do |strong|
      puts "#{strong.name} (#{strong.health})"
    end

    puts "\nWimpy Players' Statistics: (#{wimpy_players.size})"
    wimpy_players.each do |wimpy|
      puts "#{wimpy.name} (#{wimpy.health})"
    end
    puts "\n"
    # Sort code for players' points
    sorted_points = @players.sort{|a, b| a.points <=>b.points}

    sorted_points.each do |player|
      puts "#{player.name}'s point totals:"
      puts "-".ljust(65, '-')
      player.each_found_treasure do |treasure|
        puts"#{treasure.points} total #{treasure.name} points"
      end
      puts "#{player.points} grand total points"
      puts "\n"
    end
    
    puts "\nTop Players' Scores:"
    puts "-".ljust(65, '-')
    sorted_players = @players.sort {|a,b| a.score <=>b.score}
    sorted_players.each do |p|
      puts high_score_entry(p)
    end
    
  end
  
	def play(rounds)
   
		puts "\nThere are #{@players.size} players in #{@name.capitalize}:"
    @players.each do |player|
      puts player.name
    end

    puts "\nThere are #{TreasureTrove::TREASURES.size} treasures in this game:"
    TreasureTrove::TREASURES.each do |treasure| 
      puts "#{treasure.name.capitalize}#{"-".ljust(20,'-')}#{treasure.points} points"
    end
    
    1.upto(rounds) do |round|
      puts "\nRound #{round}:"
      puts "-".ljust(65, '-')
  		@players.each do |player|
        GameTurn.take_turn(player)
        puts player
  		end
    end 
	end
end