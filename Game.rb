#
#This class controlls game mainly
#
class Game
  #create Earth object with substituting FIELD_SIZE
  def initialize
    @earth = Earth.new(FIELD_SIZE)
  end
  
  #main method
  #make roop for palying, output status, calculate next generation
  public
  def start_game
    PLAY_TIMES.times do
      puts @earth.now_generation?
      print_state
      sleep DELAY_TIME
      @earth.step_generation
    end
  end
  
  #output status
  private
  def print_state
    puts @earth.state
  end
  
  #set live cells before game starts
  public
  def set_first_born(*nums)
    if nums.length % 2 == 0 then
      (nums.length / 2).times do
        row = nums.shift
        colum = nums.shift
        @earth.first_born(row, colum)
      end
      return true
    else
      return false
    end
  end
end