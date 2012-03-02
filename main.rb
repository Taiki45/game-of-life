#!/usr/bin/ruby
require File::dirname(__FILE__) + '/Life.rb'
require File::dirname(__FILE__) + '/Earth.rb'
require File::dirname(__FILE__) + '/Nature.rb'

FIELD_SIZE = 10
ALIVE = 1
DEAD = 0

earth = Earth.new(FIELD_SIZE)

earth.firstBorn(3,3)
earth.firstBorn(3,4)
earth.firstBorn(3,5)

10.times do
	puts earth.nowGeneration?
	earth.printState
	earth.stepGeneration
end

