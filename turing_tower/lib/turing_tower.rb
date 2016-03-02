require 'pry'

class Tower
  attr_reader :spoke_one, :spoke_two, :spoke_three
  def initialize(arr1, arr2, arr3)
    @base_case = arr1
    @spoke_one = arr1
    @spoke_two = arr2
    @spoke_three = arr3
  end

  def sort
    if spoke_one.length.even?
      spoke_two.push(spoke_one.pop)
    else
      spoke_three.push(spoke_one.pop)
    end
    compare_spokes
  end

  def compare_spokes
    until spoke_three == @base_case
      unless spoke_three.last % 2 == spoke_one.last % 2
        if spoke_three.empty? || (spoke_one.last < spoke_three.last)
          spoke_three.push(spoke_one.pop)
        else
          spoke_two.push(spoke_one.pop)
        end
      end
    end
    [spoke_one, spoke_two, spoke_three]
  end
end

p Tower.new([5,4,3,2,1], [], []).sort
