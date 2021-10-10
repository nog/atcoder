N = gets.to_i

n = N
results = []

while n > 0
  if n.even?
    results.push('B')
    n /= 2
  else
    results.push('A')
    n -= 1
  end
end

puts results.reverse.join('')