require_relative '../lib/turing_tower'
require 'minitest/autorun'
require 'minitest/emoji'

class TuringTowerTest < Minitest::Test
  def test_it_exists
    assert Tower.new([5,4,3,2,1], [], [])
  end

  def test_it_sorts
    tower = Tower.new([5,4,3,2,1], [], [])

    assert_equal [[], [], [5,4,3,2,1]], tower.sort
  end
end
