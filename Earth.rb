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
  def now_generation? #for confirm generation
    return @generation
  end
  
  def print_state
    @nature.print_state
  end
  
  #main method
  #create new field and calcurate next generation and substitute next field to present field
  #this may not be good design. Fix it later.
  def step_generation
    @generation += 1
    @nature.step_generation
  end
  
  #start action method
  def first_born(row, colum)
    @nature.first_born(row, colum)
  end
  
end