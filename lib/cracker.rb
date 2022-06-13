class Cracker

    attr_reader :message, :date

  def initialize(message, date)
    @message = message
    @date = date
  end

  def crack
    counter = Array.new(99999) { |i| "%05d" % i }
    key = "00000"
    decrypted_message = ""
    loop do
      decrypted_message = Decryptor.new(message, key, date).decrypt[:decryption]
      if decrypted_message[-4..-1] == " end"
        break
      elsif key == "99999"
        puts "error wrong message or date"
        break
      else
        counter = counter.rotate(1)
        key = counter[0]
      end
    end
    output = Hash.new
    output[:decryption] = decrypted_message
    output[:key] = key
    output[:date] = date
    output
  end

end
