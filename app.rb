#!/usr/bin/ruby
require File::dirname(__FILE__) + '/Life.rb'
require File::dirname(__FILE__) + '/Earth.rb'
require File::dirname(__FILE__) + '/Game.rb'

ALIVE = 1
DEAD = 0
FIELD_SIZE = 10
PLAY_TIMES = 10

game = Game.new
game.setFirstBorn(2,3, 3,3, 3,4, 3,5)
game.startGame