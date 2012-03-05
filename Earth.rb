class Earth
  #recieve a constant FIELD_SIZE and set it to @size attribute
  #create field map and create Life objects at each cell in map
  def initialize(fieldSize)
    @generation = 1
    @size = fieldSize
    @field = Array.new(@size) { Array.new(@size) { Life.new(DEAD) } }
  end
  
  attr_reader :size #set accessor for reading
  
  public
  def nowGeneration? #for confirm generation
    return @generation
  end
  
  #main method
  #create new field and calcurate next generation and substitute next field to present field
  #this may not be good design. Fix it later.
  def stepGeneration
    @generation += 1
    @nextField = Array.new(@size) { Array.new(@size) { Life.new(DEAD) } }
    (1..@size-2).each do |row|
      (1..@size-2).each do |colum|
        selectLife(row, colum)
      end
    end
    @field = @nextField
  end
  
  #judge the life should be in next future
  #this also is not good design. Fix it later.
  private
  def selectLife(row, colum)
    if deadOrAlive?(row, colum) == DEAD
      born(row, colum) if born?(row, colum)
      elsif deadOrAlive?(row, colum) == ALIVE
      if depopuration?(row, colum) || overcrowding?(row, colum) then
        die(row, colum)
        elsif keep?(row, colum)
        born(row, colum)
      end
    end
  end
  
  #count live cell around the cell. the result contain the cell.
  def measurePopuration(row, colum)
    popuration = 0
    (-1..1).each do |i|
      (-1..1).each do |j|
        popuration += 1 if deadOrAlive?(row + i, colum + j) == ALIVE
      end
    end
    return popuration
  end
  
  #judge methods
  def depopuration?(row, colum)
    return true if measurePopuration(row, colum) <= 2
    false
  end
  
  def overcrowding?(row, colum)
    return true if measurePopuration(row, colum) >= 5
    false
  end
  
  def born?(row, colum)
    return true if measurePopuration(row, colum) == 3
    false
  end
  
  def keep?(row, colum)
    return true if (3..4).include?( measurePopuration(row, colum) )
    false
  end
  
  #action methods
  #Caution, these affect @nextField now. Fix this problem later.
  def born(row, colum)
    @nextField[row][colum].born
  end
  
  def die(row, colum)
    @nextField[row][colum].die
  end
  
  #confirm methods
  public
  def deadOrAlive?(row, colum)
    return @field[row][colum].deadOrAlive?
  end
  
  def dead?(row, colum)
    return true if deadOrAlive?(row, colum) == DEAD
    false
  end
  
  def alive?(row, colum)
    return true if deadOrAlive?(row, colum) == ALIVE
    false
  end
  
  #start action method
  def firstBorn(row, colum)
    @field[row][colum].born
  end
end