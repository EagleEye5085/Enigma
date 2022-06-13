require_relative 'generator_module'

class Decryptor
  include GeneratorModule

  attr_reader :message, :key, :date, :letter_array, :keys, :offsets

  def initialize(message, key, date)
    @message = message
    @key = key
    @date = date
    @letter_array = ("a".."z").to_a << " "
    @keys = Hash.new
    @offsets = Hash.new
  end

  def decrypt
    date_generator if @date == nil
    keys_generator
    offset_generator
    index = 0
    decryption = @message.chars.map do |c|
    if !@letter_array.include?(c)
      index += 1
      c
    else
      if index == 0
        index += 1
        @letter_array.rotate(c.ord - 97).rotate(-(@offsets[:a_offset]))[0]
      elsif index == 1
        index += 1
        @letter_array.rotate(c.ord - 97).rotate(-(@offsets[:b_offset]))[0]
      elsif index == 2
        index += 1
        @letter_array.rotate(c.ord - 97).rotate(-(@offsets[:c_offset]))[0]
      elsif index == 3
        index = 0
        @letter_array.rotate(c.ord - 97).rotate(-(@offsets[:d_offset]))[0]
        end
      end
    end.join
    output = Hash.new
    output[:decryption] = decryption
    output[:key] = @key
    output[:date] = @date
    output
  end

end
