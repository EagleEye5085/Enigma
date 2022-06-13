
require_relative 'encryptor'
require_relative 'decryptor'
require_relative 'cracker'


class Enigma


  def initialize
  end

  def encrypt(message, key = nil, date = nil)
    Encryptor.new(message, key, date).encrypt
  end

  def decrypt(message, key, date =nil)
    Decryptor.new(message, key, date).decrypt
  end

  def crack(message, date)
    Cracker.new(message, date).crack
  end

end
