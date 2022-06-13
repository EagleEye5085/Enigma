require_relative 'enigma'


handle = File.open(ARGV[0], "r")

incoming_text = handle.read.downcase.chomp

handle.close

encryption = Enigma.new.encrypt(incoming_text, ARGV[2], ARGV[3])
# require 'pry'; binding.pry
writer = File.open(ARGV[1], "w")

writer.write(encryption[:encryption])

puts "Created 'encrypted.txt' with the key #{encryption[:key]} and date #{encryption[:date]}"

writer.close
