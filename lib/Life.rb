#
#This class controlls life
#
require File::dirname(__FILE__) + '/../Settings.rb'

class Life
  def self.new
    unless Settings::MUTANT
      Normal.new
    else
      Mutant.new
    end
  end
  
  class Normal
    #define instance var
    #and substitute the argument, that will be DEAD or ALIVE
    def initialize
      @dead_or_alive = DEAD
    end
    
    #set accessor for only reading
    attr_reader :dead_or_alive
    
    public
    def die
      @dead_or_alive = DEAD
      true
    end
    
    def born
      @dead_or_alive = ALIVE
      true
    end
    
    def dead?
      return true if @dead_or_alive == DEAD
      false
    end
    
    def alive?
      return true if @dead_or_alive == ALIVE
      false
    end
    
    def dead_or_alive?
      return DEAD if @dead_or_alive == DEAD
      ALIVE
    end
  end
  
  #
  #This class is extented Life and override some method
  #
  class Mutant < Normal
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
  
end
