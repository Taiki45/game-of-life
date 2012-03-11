#
#This class controlls game mainly
#
class Game
  #create Earth object with substituting FIELD_SIZE
  def initialize
    @earth = Earth.new(FIELD_SIZE)
    @previous_state, @present_state = '', ''
  end
  
  #main method
  #make roop for palying, output status, calculate next generation
  public
  def start_game
    catch :same_state do
      PLAY_TIMES.times do
        puts @earth.now_generation?
        print_state
        same_state?
        sleep DELAY_TIME
        @earth.step_generation
      end
      puts "game ended #{@earth.now_generation?} turns."
    end
  end
  
  #confirm present state and previous state are defferent 
  private
  def same_state?
    if @earth.now_generation? == 1
      @previous_state = @earth.state
      return
    end
    @previous_state = @present_state
    @present_state = @earth.state
    if @present_state == @previous_state
      puts 'Same state again.'
      puts "Game ended #{@earth.now_generation?} turn."
      throw :same_state
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