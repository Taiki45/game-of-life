#
#This class controlls generation mainly.
#
require File::dirname(__FILE__) + '/Nature.rb'

class Earth
  #recieve a constant FIELD_SIZE and set it to @size attribute
  #create field map and create Life objects at each cell in map
  def initialize(field_size)
    @generation = 1
    @nature = Nature.new(field_size)
  end
  
  public
  def state
    @nature.state
  end
  
  def now_generation? #for confirm generation
    return @generation
  end
  
  #main method
  #+1 to generation, and message to nature to process stepping generation
  def step_generation
    @generation += 1
    @nature.step_generation
  end
  
  #start action method
  def set_first_alives(row, colum)
    @nature.set_first_alives(row, colum)
  end
  
end