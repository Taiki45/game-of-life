class Game
  def initialize
    @earth = Earth.new(FIELD_SIZE)
  end
  
  def startGame(playTimes)
    playTimes.times do
      puts @earth.nowGeneration?
      printState
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
  
  def firstBorn(row, colum)
    @earth.firstBorn(row, colum)
  end
end