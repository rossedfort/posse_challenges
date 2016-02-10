require 'pry'

class Vigenere
  attr_reader :sentence, :key, :alphabet, :key_length, :sentence_length, :encoded
  def initialize(args)
    @alphabet = ("a".."z").to_a
    @key = args[0].chars.map { |char| alphabet.index(char) }
    @key_length = key.length
    @sentence = args[1..-1].join(" ").chars
    @sentence_length = args[1..-1].join("").chars.length
    @encoded = []
  end

  def encode
    # (sentence_length / key_length) ex4 x multiply the key
    # (sentence_length % key_length) ex ad the first two elements
  end
end

puts Vigenere.new(ARGV).encode
