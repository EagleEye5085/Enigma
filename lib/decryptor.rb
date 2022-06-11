class Decryptor

  attr_reader :message, :key, :date, :letter_array, :keys

  def initialize(message, key, date)
    @message = message
    @key = key
    @date = date
    @letter_array = ("a".."z").to_a << " "
    @keys = Hash.new
  end

  def key_generator
    @keys[:a_key] = @key[0..1].to_i
    @keys[:b_key] = @key[1..2].to_i
    @keys[:c_key] = @key[2..3].to_i
    @keys[:d_key] = @key[3..4].to_i
  end

end
