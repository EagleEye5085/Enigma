require 'encryptor'
require 'decryptor'

class Enigma


  def initialize
  end

  def encrypt(message, key, date)
    Encryptor.new(message, key, date).encrypt
  end

  def decrypt(message, key, date)
    Decryptor.new(message, key, date).decrypt
  end

end
