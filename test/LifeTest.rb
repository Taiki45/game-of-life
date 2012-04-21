require 'minitest/unit'
require '../lib/Life.rb'

MiniTest::Unit.autorun

DEAD = 0
ALIVE = 1

class LifeTest < MiniTest::Unit::TestCase
  def setup
    @life = Life.new
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

  def test_mutant_fearture
    Settings.class_eval('MUTANT = true')
    mutant = Life.new
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
