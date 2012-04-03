require 'minitest/unit'
require '../lib/Game.rb'

MiniTest::Unit.autorun

DEAD = 0
ALIVE = 1

class GameTest < MiniTest::Unit::TestCase
  def test_game
    code = 'def print_state; end'
    Game.class_eval code
    assert_equal(true, Game.start_game)
  end
end
