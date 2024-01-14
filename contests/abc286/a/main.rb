N, P, Q, R, S = gets.split.map(&:to_i)
A = gets.split.map(&:to_i)

res = []
res.push(*A[0...(P-1)])
res.push(*A[(R-1)..(S-1)])
res.push(*A[Q...(R-1)])
res.push(*A[(P-1)..(Q-1)])
res.push(*A[S..-1])

puts res.join(' ')