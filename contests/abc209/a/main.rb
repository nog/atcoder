A, B = gets.split.map(&:to_i)

if A > B
  puts 0
else
  puts B - A + 1
end