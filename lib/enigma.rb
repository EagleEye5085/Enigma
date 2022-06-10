class Enigma

  def initialize
  end

  def encrypt(message, key, date)
    letter_array = ("a".."z").to_a << " "
    a_key = key[0..1].to_i
    b_key = key[1..2].to_i
    c_key = key[2..3].to_i
    d_key = key[3..4].to_i
    offset = (date.to_i ** 2).to_s[-4..-1]
    a_offset = (a_key + offset[0].to_i)
    b_offset = (b_key + offset[1].to_i)
    c_offset = (c_key + offset[2].to_i)
    d_offset = (d_key + offset[3].to_i)
    offsets =[a_offset, b_offset, c_offset, d_offset]
    index = 0
    encryption = message.chars.map do |c|
    if ([(32..96).to_a, (123..126).to_a].flatten).include?(c.ord)
      index += 1
      c
    else
      if index == 0
        index += 1
        letter_array.rotate(c.ord - 97).rotate(a_offset)[0]
      elsif index == 1
        index += 1
        letter_array.rotate(c.ord - 97).rotate(b_offset)[0]
      elsif index == 2
        index += 1
        letter_array.rotate(c.ord - 97).rotate(c_offset)[0]
      elsif index == 3
        index = 0
        letter_array.rotate(c.ord - 97).rotate(d_offset)[0]
        end
      end
    end.join
    output = Hash.new
    output[:encryption] = encryption
    output[:key] = key
    output[:date] = date
    output
  end

  def decrypt(message, key, date)
    letter_array = ("a".."z").to_a << " "
    a_key = key[0..1].to_i
    b_key = key[1..2].to_i
    c_key = key[2..3].to_i
    d_key = key[3..4].to_i
    offset = (date.to_i ** 2).to_s[-4..-1]
    a_offset = (a_key + offset[0].to_i)
    b_offset = (b_key + offset[1].to_i)
    c_offset = (c_key + offset[2].to_i)
    d_offset = (d_key + offset[3].to_i)
    offsets =[a_offset, b_offset, c_offset, d_offset]
    index = 0
    decryption = message.chars.map do |c|
    if ([(32..96).to_a, (123..126).to_a].flatten).include?(c.ord)
      index += 1
      c
    else
      # require 'pry'; binding.pry'
      if index == 0
        index += 1
        letter_array.rotate(c.ord - 97).rotate(-a_offset)[0]
      elsif index == 1
        index += 1
        letter_array.rotate(c.ord - 97).rotate(-b_offset)[0]
      elsif index == 2
        index += 1
        letter_array.rotate(c.ord - 97).rotate(-c_offset)[0]
      elsif index == 3
        index = 0
        letter_array.rotate(c.ord - 97).rotate(-d_offset)[0]
        end
      end
    end.join
    output = Hash.new
    output[:decryption] = decryption
    output[:key] = key
    output[:date] = date
    output
  end

end
