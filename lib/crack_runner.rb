require_relative 'enigma'


handle = File.open(ARGV[0], "r")

incoming_text = handle.read.downcase.chomp

handle.close

decryption = Enigma.new.crack(incoming_text, ARGV[2])
writer = File.open(ARGV[1], "w")

writer.write(decryption[:decryption])

puts "Created 'decrypted.txt' with the key #{decryption[:key]} and date #{decryption[:date]}"

writer.close
