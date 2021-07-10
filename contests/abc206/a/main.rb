N = gets.to_i

x = (N * 1.08).to_i

if x < 206
  puts 'Yay!'
elsif x == 206
  puts 'so-so'
else
  puts ':('
end