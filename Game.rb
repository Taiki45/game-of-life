class Game
  def initialize
    @earth = Earth.new(FIELD_SIZE)
  end
  
  def startGame
    PLAY_TIMES.times do
      puts @earth.nowGeneration?
      printState
      sleep 0.3
      @earth.stepGeneration
    end
  end
  
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