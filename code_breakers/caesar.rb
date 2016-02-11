require 'pry'
class Ceaser
  attr_reader :key, :sentence, :alphabet

  def initialize(args)
    @key = args[0].to_i
    @sentence = args[1..-1]
    @alphabet = ("a".."z").to_a
  end

  def encode
    sentence.map do |word|
      word.chars.map do |char|
        if alphabet.include?(char)
          alphabet[(alphabet.index(char) + key) % 26]
        elsif alphabet.include?(char.downcase)
          alphabet[(alphabet.index(char.downcase) + key) % 26].upcase
        else
          char
        end
      end.join("")
    end.join(" ")
  end
end

 puts Ceaser.new(ARGV).encode
