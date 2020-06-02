n, s = gets.split.map(&:to_i)
a = gets.split.map(&:to_i).sort
MOD = 998244353
dp = Array.new(n+1){ [0] * (s + 1)}
dp[0][0] = 1

1.upto(n) do |i|
  _a = a[i-1]
  0.upto(s) do |j|
    dp[i][j] = (dp[i][j] + 2 * dp[i-1][j]) % MOD
    if j - _a >= 0
      dp[i][j] = (dp[i][j] + dp[i-1][j-_a]) % MOD
    end
  end
end

puts dp[n][s]