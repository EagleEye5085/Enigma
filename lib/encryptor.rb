require 'generator_module'

class Encryptor
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

  def encrypt
    key_generator if @key == nil
    date_generator if @date == nil
    keys_generator
    offset_generator
    index = 0
    encryption = @message.chars.map do |c|
    if ([(32..96).to_a, (123..126).to_a].flatten).include?(c.ord)
      index += 1
      c
    else
      if index == 0
        index += 1
        @letter_array.rotate(c.ord - 97).rotate(@offsets[:a_offset])[0]
      elsif index == 1
        index += 1
        @letter_array.rotate(c.ord - 97).rotate(@offsets[:b_offset])[0]
      elsif index == 2
        index += 1
        @letter_array.rotate(c.ord - 97).rotate(@offsets[:c_offset])[0]
      elsif index == 3
        index = 0
        @letter_array.rotate(c.ord - 97).rotate(@offsets[:d_offset])[0]
        end
      end
    end.join
    output = Hash.new
    output[:encryption] = encryption
    output[:key] = @key
    output[:date] = @date
    output
  end

end
