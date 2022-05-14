A, B, C, X = gets.split.map(&:to_i)

if X <= A
  puts 1
elsif B < X
  puts 0
else
  puts C.to_f / (B - A)
end