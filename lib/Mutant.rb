#
#This class is extented Life and override some method
#
class Mutant < Life
  def initialize
    @dead_or_alive = DEAD
    @death_count = 0
    @birth_count = 0
  end
  
  public
  def die
    @dead_or_alive = DEAD
    @death_count += 1
    mutation = @death_count % (rand(Settings::MUTANT_LEVEL)+1) == 0
    @dead_or_alive = ALIVE if mutation
    true
  end
  
  def born
    @dead_or_alive = ALIVE
    true
  end
end