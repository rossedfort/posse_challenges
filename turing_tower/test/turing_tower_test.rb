require_relative '../lib/turing_tower'
require 'minitest/autorun'
require 'minitest/emoji'

class TuringTowerTest < Minitest::Test
  def test_it_exists
    assert TuringTower.new
  end
end
