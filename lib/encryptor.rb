require 'generator_module'

class Encryptor
  include GeneratorModule

  attr_reader :message, :key, :date

  def initialize(message, key, date)
    @message = message
    @key = key
    @date = date
  end

  def encrypt

    key_generator if @key == nil
    date_generator if @date == nil
    letters = letter_array_generator
    offsets = offset_generator
    index = 0
    encryption = @message.chars.map do |c|
    if ([(33..96).to_a, (123..126).to_a].flatten).include?(c.ord)
        c
    else
      if c.ord == 32
        c = "{"
      end
      if index == 0
        index += 1
        letters.rotate(c.ord - 97 + offsets[:a_offset])[0]
      elsif index == 1
        index += 1
        letters.rotate(c.ord - 97 + offsets[:b_offset])[0]
      elsif index == 2
        index += 1
        letters.rotate(c.ord - 97 + offsets[:c_offset])[0]
      elsif index == 3
        index = 0
        letters.rotate(c.ord - 97 + offsets[:d_offset])[0]
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
