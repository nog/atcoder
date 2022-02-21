S = gets.chomp.split('')
a, b = gets.split.map(&:to_i)

_a = S[a-1]
_b = S[b-1]

S[a-1] = _b
S[b-1] = _a

puts S.join('')