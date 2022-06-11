class Decryptor

  attr_reader :message, :key, :date, :letter_array, :keys, :offsets

  def initialize(message, key, date)
    @message = message
    @key = key
    @date = date
    @letter_array = ("a".."z").to_a << " "
    @keys = Hash.new
    @offsets = Hash.new
  end

  def key_generator
    @keys[:a_key] = @key[0..1].to_i
    @keys[:b_key] = @key[1..2].to_i
    @keys[:c_key] = @key[2..3].to_i
    @keys[:d_key] = @key[3..4].to_i
  end

  def offset_generator
    offset = (@date.to_i ** 2).to_s[-4..-1]
    @offsets[:a_offset] = (@keys[:a_key] + offset[0].to_i)
    @offsets[:b_offset] = (@keys[:b_key] + offset[1].to_i)
    @offsets[:c_offset] = (@keys[:c_key] + offset[2].to_i)
    @offsets[:d_offset] = (@keys[:d_key] + offset[3].to_i)
  end

end
