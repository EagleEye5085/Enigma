require 'decryptor'

class Cracker < Decryptor

    attr_reader :message, :date

  def initialize(message, date)
    @message = message
    @date = date
    @key = "00000"
    @counter = Array.new(99999) { |i| "%05d" % i }
  end

  def crack
    decrypted_message = ""
    loop do
      decrypted_message = decrypt[:decryption]
      if decrypted_message[-4..-1] == " end"
        break
      elsif key == "99999"
        puts "error wrong message or date"
        break
      else
        @counter = @counter.rotate(1)
        @key = @counter[0]
      end
    end
    decrypt
  end

end
