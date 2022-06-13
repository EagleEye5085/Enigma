require 'generator_module'

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
      # require 'pry'; binding.pry
    if ([(33..96).to_a, (123..126).to_a].flatten).include?(c.ord)
        c
    else
      if c.ord == 32
        c = "{"
      end
      if index == 0
        index += 1
        @letter_array.rotate(c.ord - 97 - @offsets[:a_offset])[0]
      elsif index == 1
        index += 1
        @letter_array.rotate(c.ord - 97 - @offsets[:b_offset])[0]
      elsif index == 2
        index += 1
        @letter_array.rotate(c.ord - 97 - @offsets[:c_offset])[0]
      elsif index == 3
        index = 0
        @letter_array.rotate(c.ord - 97 - @offsets[:d_offset])[0]
        end
      end
    end.join
    # require 'pry'; binding.pry
    output = Hash.new
    output[:decryption] = decryption
    output[:key] = @key
    output[:date] = @date
    output
  end

end
