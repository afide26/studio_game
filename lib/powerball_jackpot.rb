class Powerball
  attr_accessor :pick
  def initialize 
    @pick = []
  end
  
  def lucky_pick
    1.upto(6).each do |pick|
      puts rand(1..40)
    end
  end
  
  def powerball_pick
    puts rand(1..20)
  end
end

draw1 = Powerball.new
draw1.lucky_pick
puts draw1.powerball_pick