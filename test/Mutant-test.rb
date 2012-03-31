require 'minitest/unit'
require '../lib/Life.rb'
require '../lib/Mutant.rb'
require '../Settings.rb'

MiniTest::Unit.autorun

DEAD = 0
ALIVE = 1

class TestMutant < MiniTest::Unit::TestCase
  def setup
    @mutant = Mutant.new 0
  end

  def test_conditions
    assert_equal true, @mutant.dead?
    assert_equal false, @mutant.alive?
    assert_equal 0, @mutant.dead_or_alive?
    assert_equal 0, @mutant.dead_or_alive
  end

  def test_chages_born
    assert_equal true, @mutant.born
    assert_equal 1, @mutant.dead_or_alive?
  end

  def test_changes_die
    assert_equal true, @mutant.die
    assert_equal 0, @mutant.dead_or_alive?
  end

  def test_mutant_die
    mutant = Mutant.new 0
    die_loop = lambda do
      loop do
        mutant.die
        break if mutant.alive?
      end
      true
    end
    assert_equal true, die_loop.call
  end
end
