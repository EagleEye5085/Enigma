require 'date'
module GeneratorModule

  def letter_array_generator
    ("a".."z").to_a << " "
  end

  def key_generator
    @key = 5.times.map{rand(10)}.join
  end

  def date_generator
    @date = Date.parse(Date.today.to_s).strftime('%d/%m/%y').delete "/"
  end

  def keys_generator
    keys = Hash.new
    keys[:a_key] = @key[0..1].to_i
    keys[:b_key] = @key[1..2].to_i
    keys[:c_key] = @key[2..3].to_i
    keys[:d_key] = @key[3..4].to_i
    keys
  end

  def offset_generator
    keys = keys_generator

    offsets = {}
    offset = (@date.to_i ** 2).to_s[-4..-1]
    offsets[:a_offset] = (keys[:a_key] + offset[0].to_i)
    offsets[:b_offset] = (keys[:b_key] + offset[1].to_i)
    offsets[:c_offset] = (keys[:c_key] + offset[2].to_i)
    offsets[:d_offset] = (keys[:d_key] + offset[3].to_i)
    # require'pry'; binding.pry
    offsets
  end

end
