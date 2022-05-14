N = gets.to_i
MOD = 998244353

result = 0
# dp = Array.new(N){ Array.new 9 }
# dp[0] = [1] * 9

d1, d2, d3, d4, d5 = 1,1,1,1,1
(N-1).times do
  nd1 = d1 + d2 % MOD
  nd2 = d1 + d2 + d3 % MOD
  nd3 = d2 + d3 + d4 % MOD
  nd4 = d3 + d4 + d5 % MOD
  nd5 = d4 + d4 + d5 % MOD
  d1, d2, d3, d4, d5 = nd1, nd2, nd3, nd4, nd5
end

puts (d5 + 2 * (d1 + d2 + d3 + d4)) % MOD