n, k = gets.split.map(&:to_i)

n = n % k
n2 = k - n

if n > n2
  puts n2
else
  puts n
end