module Playable
	def w00t
	  self.health += 15
		puts "#{@name} got w00ted!"
	end

	def blam
	  self.health -= 10
		puts "#{@name} got blammed!"
	end

	def score
		self.health + points
	end
  
  def <=>(other)
    other.score <=> score
  end
  def strong?
    @health > 100
  end
  
  def wimpy?
    @health <= 100
  end
end