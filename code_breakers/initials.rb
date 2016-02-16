class Initials
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def print_initials
    initials = name.map do |word|
      word[0].upcase
    end.join
  end
end

puts Initials.new(ARGV).print_initials
