N, K = gets.split.map(&:to_i)
A = Array.new N
N.times do |i|
    A[i] = gets.to_i
end

dp = Array.new N
dp[0] = [1,0]

1.upto(N) do |i|
end