#
#This class controlls field that lifes live in
#
class Nature
  def initialize(field_size)
    @size = field_size
    @field = Array.new(@size) { Array.new(@size) { Life.new(DEAD) } }
  end
  
  attr_reader :size #set accessor for reading
  
  public
  def state
    state = '-' * 20
    state += "\n"
    (1..size-2).each do |row|
      (1..size-2).each do |colum|
        state += ' * ' if alive?(row, colum)
        state += ' - ' if dead?(row, colum)
      end
      state += "\n"
    end
    state
  end
  
  public
  def step_generation
    @next_field = Array.new(@size) { Array.new(@size) { Life.new(DEAD) } }
    (1..@size-2).each do |row|
      (1..@size-2).each do |colum|
        select_life(row, colum)
      end
    end
    @field = @next_field
  end
  
  #judge the life should be in next future
  #this also is not good design. Fix it later.
  private
  def select_life(row, colum)
    if dead_or_alive?(row, colum) == DEAD
      born(row, colum) if born?(row, colum)
      elsif dead_or_alive?(row, colum) == ALIVE
      if depopuration?(row, colum) || overcrowding?(row, colum) then
        die(row, colum)
        elsif keep?(row, colum)
        born(row, colum)
      end
    end
  end
  
  #count live cell around the cell. the result contain the cell.
  def measure_popuration(row, colum)
    popuration = 0
    (-1..1).each do |i|
      (-1..1).each do |j|
        popuration += 1 if dead_or_alive?(row + i, colum + j) == ALIVE
      end
    end
    return popuration
  end
  
  #judge methods
  def depopuration?(row, colum)
    return true if measure_popuration(row, colum) <= 2
    false
  end
  
  def overcrowding?(row, colum)
    return true if measure_popuration(row, colum) >= 5
    false
  end
  
  def born?(row, colum)
    return true if measure_popuration(row, colum) == 3
    false
  end
  
  def keep?(row, colum)
    return true if (3..4).include?( measure_popuration(row, colum) )
    false
  end
  
  #action methods
  #Caution, these affect @next_field now. Fix this problem later.
  def born(row, colum)
    @next_field[row][colum].born
  end
  
  def die(row, colum)
    @next_field[row][colum].die
  end
  
  #confirm methods
  private
  def dead_or_alive?(row, colum)
    return @field[row][colum].dead_or_alive?
  end
  
  def dead?(row, colum)
    return true if dead_or_alive?(row, colum) == DEAD
    false
  end
  
  def alive?(row, colum)
    return true if dead_or_alive?(row, colum) == ALIVE
    false
  end
  
  #start action method
  public
  def first_born(row, colum)
    @field[row][colum].born
  end
  
end