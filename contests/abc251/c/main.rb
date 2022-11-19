N = gets.to_i

result = nil
score = 0
hash = {}
N.times do |i|
  s, t = gets.split
  t = t.to_i
  next if hash[s]
  hash[s] = true
  next if t <= score
  score = t
  result = i + 1
end

puts result