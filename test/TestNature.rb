require 'minitest/unit'
require '../lib/Life.rb'
require '../lib/Nature.rb'
require '../Settings.rb'

MiniTest::Unit.autorun

DEAD = 0
ALIVE = 1

class TestNature < MiniTest::Unit::TestCase
  def setup
    @num = 10
    @nature = Nature.new @num
  end

  def test_size
    assert_equal(@num, @nature.size)
    assert_equal(@num, @nature.length)
  end

  def test_state
    assert_equal(false, @nature.state.include?('*'))
  end

  def test_first_born
    @nature.set_first_alives(2,2)
    assert_equal(true, @nature.state.include?('*'))
  end

  def test_step_generation
    @nature.step_generation
    assert_equal(false, @nature.state.include?('*'))
  end
end
