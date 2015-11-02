require_relative 'game'


player1 = Player.new("larry", 30)
player2 = Player.new("curly", 60)
player3 = Player.new("moe", 100)
player4 = Player.new("shemp", 90)
players = [player1, player2, player3]


knuckleheads = Game.new("knuckleheads")
knuckleheads.add_player(player1)
knuckleheads.add_player(player3)
knuckleheads.add_player(player2)
knuckleheads.play





