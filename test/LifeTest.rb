require 'minitest/unit'
require '../lib/Life.rb'

MiniTest::Unit.autorun

DEAD = 0
ALIVE = 1

class TestLife < MiniTest::Unit::TestCase
  def setup
    @life = Life.new 0
  end

  def test_conditions
    assert_equal true, @life.dead?
    assert_equal false, @life.alive?
    assert_equal 0, @life.dead_or_alive?
    assert_equal 0, @life.dead_or_alive
  end

  def test_chages_born
    assert_equal true, @life.born
    assert_equal 1, @life.dead_or_alive?
  end

  def test_changes_die
    assert_equal true, @life.die
    assert_equal 0, @life.dead_or_alive?
  end
end
