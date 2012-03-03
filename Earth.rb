class Earth
  def initialize(fieldSize)
    @generation = 1
    @size = fieldSize
    @field = Array.new(@size) { Array.new(@size) { Life.new(DEAD) } }
  end
  
  attr_reader :size
  
  def nowGeneration?
    return @generation
  end
  
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
  
  def measurePopuration(row, colum)
    popuration = 0
    (-1..1).each do |i|
      (-1..1).each do |j|
        popuration += 1 if deadOrAlive?(row + i, colum + j) == ALIVE
      end
    end
    return popuration
  end
  
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
  
  def born(row, colum)
    @nextField[row][colum].born
  end
  
  def die(row, colum)
    @nextField[row][colum].die
  end
  
  def firstBorn(row, colum)
    @field[row][colum].born
  end
end