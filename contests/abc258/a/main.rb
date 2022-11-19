K = gets.to_i

m = K % 60
h = 21 + (K / 60)

puts "#{sprintf("%02d", h)}:#{sprintf("%02d", m)}"