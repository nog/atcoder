s, k = gets.split
S = s.split('').sort
K = k.to_i

puts S.permutation(s.length).uniq.sort[K-1].join('')
