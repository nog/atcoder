N, K = gets.split.map(&:to_i)
P = gets.split.map(&:to_i)
Q = gets.split.map(&:to_i)
MOD = 998244353
list = Array.new N
N.times do |i|
  a = P[i]
  b = Q[i]
  list[a-1] = b
end

dp = Array.new N+1
dp[0] = [{N+1 => 1}]

N.times do |i|
  bd = dp[i]
  d = []
  N.times do |j|
    break unless bd[j]
    b = bd[j]
    
  end
  dp[i+1] = d
end