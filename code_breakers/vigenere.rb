require 'pry'

class Vigenere
  attr_reader :sentence, :key, :alphabet, :key_length
  def initialize(args)
    @alphabet = ("a".."z").to_a
    @key = args[0].chars.map { |char| alphabet.index(char) }
    @key_length = key.length
    @sentence = args[1..-1].join(" ").chars
  end


  def encode
    key_index = 0
    sentence.map do |char|
      if key_index == key_length
        key_index = 0
      end

      if alphabet.include?(char)
        char = alphabet[(alphabet.index(char) + key[key_index]) % 26]
        key_index += 1
      elsif alphabet.include?(char.downcase)
        char = alphabet[(alphabet.index(char.downcase) + key[key_index]) % 26].upcase
        key_index += 1
      end
        char
    end.join("")
  end
end

puts Vigenere.new(ARGV).encode
