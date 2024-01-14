N = gets.to_i
S = gets.split('')

res = []
N.times do |i|
  res.push(S[i], S[i])
end

puts res.join('')