N, M, K = gets.split.map(&:to_i)
MOD =  998244353

dp = Array.new N+1
dp[0] = Array.new(K+1, 0)
dp[0][0] = 1
N.times do |i|
  cd = dp[i]
  nd = Array.new(K+1,0)
  list = []
  sum = 0
  cd.each.with_index do |c, i|
    next if c == 0
    1.upto(M) do |d|
      next if i+d > K
      nd[i+d] = nd[i+d] + c % MOD
    end
  end
  dp[i+1] = nd
end

puts dp[N].sum % MOD