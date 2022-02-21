X = gets.chomp.split('').map(&:to_i)

sum = X.sum
zan = 0
result = []

while(X[0]) do
  result.push((sum + zan)% 10)
  last = X.pop
  zan = (sum + zan) / 10
  sum -= last
end
if zan > 0
  result.push(zan)
end

puts result.reverse.join('')