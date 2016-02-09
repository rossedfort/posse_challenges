class Initials
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def print_initials
    initials = name.map do |word|
      word[0].upcase
    end.join
    puts initials
  end
end

Initials.new(ARGV).print_initials
