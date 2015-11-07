require_relative 'game'
require_relative 'treasure_trove'
require_relative 'iterators'
require_relative 'berserk_player'
require_relative 'clumsy_player'

# player1 = Player.new("larry", 100)
# player2 = Player.new("curly", 95)
# player3 = Player.new("moe", 150)
# player4 = Player.new("shemp", 90)
# players = [player1, player2, player3]



knuckleheads = Game.new("knuckleheads")
# knuckleheads.add_player(player1)
# knuckleheads.add_player(player3)
# knuckleheads.add_player(player2)
# knuckleheads.add_player(player4)
knuckleheads.load_players(ARGV.shift || "players.csv")
berserker = BerserkPlayer.new("berseker", 100)
knuckleheads.add_player(berserker)
clumsy = ClumsyPlayer.new("clumsy", 100)
knuckleheads.add_player(clumsy)


loop do 
  puts "How many games?"
  answer = gets.chomp.downcase  

  case answer
  when /^\d+$/
    puts "Enjoy your #{answer.to_i} game"
    knuckleheads.play(answer.to_i)
  when 'quit','exit', 'q', 'e', 's'
    knuckleheads.print_stats
    break
  else    
   puts "Welcome to the Studio Game ('quit' or type a number to continue playing)"
  end    
end

knuckleheads.save_high_scores