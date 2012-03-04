class Game
  def initialize
    @earth = Earth.new(FIELD_SIZE)
  end
  
  public
  def startGame
    PLAY_TIMES.times do
      puts @earth.nowGeneration?
      printState
      sleep 1
      @earth.stepGeneration
    end
  end
  
  private
  def printState
    puts '-' * 40
    (1..@earth.size-2).each do |row|
      (1..@earth.size-2).each do |colum|
        print ' * ' if @earth.alive?(row, colum)
        print ' - ' if @earth.dead?(row, colum)
      end
      print "\n"
    end
  end
  
  public
  def setFirstBorn(*nums)
    if nums.length % 2 == 0 then
      (nums.length / 2).times do
        row = nums.shift
        colum = nums.shift
        @earth.firstBorn(row, colum)
      end
      return true
    else
      return false
    end
  end
end