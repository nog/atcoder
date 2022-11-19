R, C = gets.split.map(&:to_i)
A = []
A.push gets.split.map(&:to_i)
A.push gets.split.map(&:to_i)

puts A[R-1][C-1]