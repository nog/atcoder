SX, SY, GX, GY = gets.split.map(&:to_f)

puts SX + SY * (GX - SX) / (SY + GY)