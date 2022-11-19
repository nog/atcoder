N, X = gets.split.map(&:to_i)
result = Float::INFINITY

cur = 0
count = 0
N.times do
  a, b = gets.split.map(&:to_i)
  cur += a
  r = cur + b * (X - count)
  result = r if r < result
  cur += b
  count += 1
  break if count >= X
end

puts result