#
#This class controlls field that lifes live in
#
class Nature
  def initialize(field_size)
    @size = field_size
    unless Settings::MUTANT
      @field = Array.new(@size) { Array.new(@size) { Life.new(DEAD) } }
    else
      @field = Array.new(@size) { Array.new(@size) { Mutant.new(DEAD) } }
    end
    @birth_list, @death_list = Array.new, Array.new
  end
  
  attr_reader :size #set accessor for reading
  alias length size
  
  #Make state and return
  public
  def state
    state = '-' * 20
    state += "\n"
    (0..size-1).each do |row|
      (0..size-1).each do |colum|
        state += ' * ' if alive?(row, colum)
        state += ' - ' if dead?(row, colum)
      end
      state += "\n"
    end
    state
  end
  
  #start action method
  public
  def set_first_alives(row, colum)
    @field[row][colum].born
    true
  end
  
  #Main method
  #Calcurate and proccess for step generation
  public
  def step_generation
    #Calcurate how each life will be
    (0..@size-1).each do |row|
      (0..@size-1).each do |colum|
        select_life(row, colum)
      end
    end
    #Do action follwing above result
    @birth_list.each do |birth|
      birth_row = birth.shift
      birth_colum = birth.shift
      born(birth_row, birth_colum)
    end
    @death_list.each do |death|
      death_row = death.shift
      death_colum = death.shift
      die(death_row, death_colum)
    end
    #Initialize lists for next generation
    @birth_list, @death_list = Array.new, Array.new
    true
  end
  
  #judge the life should be in next generation
  private
  def select_life(row, colum)
    if dead_or_alive?(row, colum) == DEAD
      pool_birth(row, colum) if born?(row, colum)
      elsif dead_or_alive?(row, colum) == ALIVE
      pool_death(row, colum) if depopuration?(row, colum) || overcrowding?(row, colum)
    end
  end
  
  #count live cell around the cell. the result contain the cell.
  private
  def measure_popuration(row, colum)
    popuration = 0
    (-1..1).each do |i|
      (-1..1).each do |j|
          if row+i == -1 && colum+j == -1
            popuration += 1 if dead_or_alive?(@size-1, @size-1) == ALIVE
          elsif row+i == @size && colum+j == @size
            popuration += 1 if dead_or_alive?(0, 0) == ALIVE
          elsif row+i == -1 && colum+j == @size
            popuration += 1 if dead_or_alive?(@size-1, 0) == ALIVE
          elsif row+i == @size && colum+j == -1
            popuration += 1 if dead_or_alive?(0, @size-1) == ALIVE
          elsif row+i == -1
            popuration += 1 if dead_or_alive?(@size-1, colum + j) == ALIVE
          elsif colum+j == -1
            popuration += 1 if dead_or_alive?(row+i, @size-1) == ALIVE
          elsif row+i == @size
            popuration += 1 if dead_or_alive?(0, colum+j) == ALIVE
          elsif colum + j == @size
            popuration += 1 if dead_or_alive?(row + i, 0) == ALIVE
          else
            popuration += 1 if dead_or_alive?(row + i, colum + j) == ALIVE
          end
      end
    end
    return popuration
  end
  
  #judge methods
  private
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
  private
  def born(row, colum)
    @field[row][colum].born
  end
  
  def die(row, colum)
    @field[row][colum].die
  end
  
  def pool_birth(row, colum)
    @birth_list.push([row, colum])
  end
  
  def pool_death(row, colum)
    @death_list.push([row, colum])
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
  
end