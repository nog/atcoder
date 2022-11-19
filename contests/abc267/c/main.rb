N, M = gets.split.map(&:to_i)
A = gets.split.map(&:to_i)

sum = A[0...M].sum
res = 0
M.times do |i|
  res += A[i] * (i+1)
end
result = res
M.upto(N-1) do |i|
  res += (A[i] * M) - sum
  sum += A[i] - A[i - M]
  result = res if res > result
end
puts result