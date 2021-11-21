N = gets.to_i
result = 0
hash = {}
N.times do |i|
  l = gets.split.map(&:to_i)
  s = l.join('-')
  next if hash[s]
  hash[s] = true
  result += 1
end

puts result