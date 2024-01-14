N, K = gets.split.map(&:to_i)
A = gets.split.map(&:to_i)

s = K
hash = {}

A.each do |a|
  hash[a] = true
end

res = 0
K.times do
  if hash[res]
    res += 1
  else
    break
  end
end

puts res