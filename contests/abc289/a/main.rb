s = gets.chomp

puts s.gsub('0', '2').gsub('1', '0').gsub('2', '1')