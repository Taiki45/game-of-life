#!/usr/bin/ruby
require File::dirname(__FILE__) + '/Game.rb'

#define ALIVE and DEAD
ALIVE = 1
DEAD = 0

#set game settings
FIELD_SIZE = 10
PLAY_TIMES = 10
DELAY_TIME = 0.5

game = Game.new

#set live cells when game starts
#each consists of row number and colum number
game.set_first_alives(2,3, 3,2, 3,3, 2,4)#2,3, 3,2, 3,3, 4,3

game.start_game