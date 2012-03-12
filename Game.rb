require File::dirname(__FILE__) + '/Life.rb'
require File::dirname(__FILE__) + '/Earth.rb'
require File::dirname(__FILE__) + '/Nature.rb'
require File::dirname(__FILE__) + '/Settings.rb'
#
#This class controlls game mainly
#
class Game
  #create Earth object with substituting FIELD_SIZE
  def initialize
    @play_times = Settings::PLAY_TIMES
    @delay_time = Settings::DELAY_TIME
    @earth = Earth.new(Settings::FIELD_SIZE)
    @previous_state, @present_state = String.new, String.new
  end
  
  #singleton method
  #create Game instance and processing
  public
  def self.start_game
    game = Game.new
    game.process_game
  end
  
  #make roop for palying, output status, calculate next generation
  public
  def process_game
    set_first_alives(Settings::FIRST_ALIVES)
    catch :same_state do
      @play_times.times do
        puts @earth.now_generation?
        print_state
        same_state?
        sleep @delay_time
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
  private
  def set_first_alives(nums)
    if nums.length % 2 == 0 then
      (nums.length / 2).times do
        row = nums.shift
        colum = nums.shift
        @earth.set_first_alives(row, colum)
      end
    end
  end
end