class Game
  #create Earth object with substituting FIELD_SIZE
  def initialize
    @earth = Earth.new(FIELD_SIZE)
  end
  
  #main method
  #make roop for palying, output status, calculate next generation
  public
  def startGame
    PLAY_TIMES.times do
      puts @earth.nowGeneration?
      printState
      sleep DELAY_TIME
      @earth.stepGeneration
    end
  end
  
  #output status
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
  
  #set live cells before game starts
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