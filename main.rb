#!/usr/bin/ruby
require File::dirname(__FILE__) + '/Life.rb'
require File::dirname(__FILE__) + '/Earth.rb'
require File::dirname(__FILE__) + '/Game.rb'

FIELD_SIZE = 10
ALIVE = 1
DEAD = 0

game = Game.new

game.firstBorn(3,3)
game.firstBorn(3,4)
game.firstBorn(3,5)

game.startGame(10)

