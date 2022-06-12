require 'encryptor'
require 'decryptor'

class Enigma


  def initialize
  end

  def encrypt(message, key = nil, date = nil)
    Encryptor.new(message, key, date).encrypt
  end

  def decrypt(message, key, date =nil)
    Decryptor.new(message, key, date).decrypt
  end

end
