X, Y = gets.split.map(&:to_i)

if X >= Y
  puts 0
  exit
end

puts ((Y - X).to_f / 10).ceil