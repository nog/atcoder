n, m = gets.split.map(&:to_i)
a = gets.split.map(&:to_i)

sum = a.sum
if sum > n
  puts -1
else
  puts n - sum
end