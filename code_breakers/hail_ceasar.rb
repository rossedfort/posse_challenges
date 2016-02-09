class Ceaser
  attr_reader :key, :sentence, :map

  def initialize(key, sentence)
    @key = key
    @map = ("a".."z").to_a
    @sentence = sentence.chars
  end

  def encrypt(key, sentence)
    sentence.map.with_index do |char, index|
      index += key
    end
  end

end

Ceaser.new(ARGV).encrypt
