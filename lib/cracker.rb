require_relative 'decryptor'

class Cracker < Decryptor

    attr_reader :message, :date

  def initialize(message, date)
    @message = message
    @date = date
    @key = "00000"
    @counter = Array.new(100000) { |i| "%05d" % i }
  end

  def crack
    decrypted_message = ""
    loop do
      decrypted_message = decrypt[:decryption]
      if decrypted_message[-4..-1] == " end"
        break
      elsif @key == "99999"
        break
      else
        @counter = @counter.rotate(1)
        @key = @counter[0]
      end
    end
    if @key == "99999"
      return p "wrong message or date"
    end
    if @key < "999999"
      return decrypt
    end
  end

end
