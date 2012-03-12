#
#This class controlls generation mainly.
#
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
  #create new field and calcurate next generation and substitute next field to present field
  #this may not be good design. Fix it later.
  def step_generation
    @generation += 1
    @nature.step_generation
  end
  
  #start action method
  def set_first_alives(row, colum)
    @nature.set_first_alives(row, colum)
  end
  
end