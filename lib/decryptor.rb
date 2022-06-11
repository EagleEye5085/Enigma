class Decryptor

  attr_reader :message, :key, :date

  def initialize(message, key, date)
    @message = message
    @key = key
    @date = date
    @letter_array = ("a".."z").to_a << " "
  end

end
