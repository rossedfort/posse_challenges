class Enums
  def self.any?(collection, condition)
    collection.each do |num|
      return true if condition.call(num)
    end
    false
  end

  def self.select(collection, condition)
    arr = []
    collection.each do |num|
      arr.push(num) if condition.call(num)
    end
    arr
  end

  def self.reduce(collection, condition)
    arr = []
    collection.each do |element|
      arr.push(condition.call(element))
    end
    arr
  end

  def self.reject(collection, condition)
    arr = []
    collection.each do |num|
      arr.push(num) unless condition.call(num)
    end
    arr
  end
end

collection = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
condition = Proc.new { |a| a % 2 != 0 }
p Enums.reject(collection, condition)
