S = gets.chomp

res = S.size * 2
res -= S.count('v')
puts res