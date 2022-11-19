N = gets.to_i
A = gets.split.map(&:to_i)

dp = Array.new N + 1
dp[0] = [0, A.last]

N.times do |i|
  b0, b1 = dp[i]
  dp[i+1] = [b1, [b0, b1].min + A[i]]
end

r1 =  dp[-1].min

dp = Array.new N
dp[0] = [A.last, A.last]

(N-1).times do |i|
  b0, b1 = dp[i]
  dp[i+1] = [b1, [b0, b1].min + A[i]]
end

r2 =  dp[-1].min

puts [r1, r2].min