#!/usr/bin/ruby
require File::dirname(__FILE__) + '/Life.rb'
require File::dirname(__FILE__) + '/Earth.rb'

FIELD_SIZE = 8
ALIVE = 1
DEAD = 0

earth = Earth.new(FIELD_SIZE)

earth.born(1,4)
p earth.deadOrAlive?(1,4)