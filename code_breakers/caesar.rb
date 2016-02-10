require 'pry'
class Ceaser
  attr_reader :key, :sentence, :map

  def initialize(args)
    @key = args[0].to_i
    @sentence = args[1..-1]
    @map = ("a".."z").to_a
  end

  def encode
    sentence.map do |word|
      word.chars.map do |char|
        if map.include?(char)
          map[(map.index(char) + key) % 26]
        else
          map[(map.index(char.downcase) + key) % 26].upcase
        end
      end.join("")
    end.join(" ")
  end
end

 puts Ceaser.new(ARGV).encode
