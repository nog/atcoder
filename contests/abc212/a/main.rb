A, B = gets.split.map(&:to_i)

if B == 0
  puts "Gold"
elsif A == 0
  puts "Silver"
else
  puts 'Alloy'
end