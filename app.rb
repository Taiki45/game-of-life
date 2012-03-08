#!/usr/bin/ruby
require File::dirname(__FILE__) + '/Life.rb'
require File::dirname(__FILE__) + '/Earth.rb'
require File::dirname(__FILE__) + '/Game.rb'

#define ALIVE and DEAD
ALIVE = 1
DEAD = 0

#set game settings
FIELD_SIZE = 20
PLAY_TIMES = 30
DELAY_TIME = 0.1

game = Game.new

#set live cells when game starts
#each consists of row number and colum number
game.set_first_born(2,3, 3,3, 3,4, 3,5, 3,6)

game.start_game