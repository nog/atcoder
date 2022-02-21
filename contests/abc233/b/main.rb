L, R = gets.split.map(&:to_i)
S = gets.chomp.split('')

result = []
result += S[0..(L-2)] if L > 1
result += S[(L-1)..(R-1)].reverse
result += S[R..(-1)]

puts result.join('')