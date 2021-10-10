N = gets.to_i
A = gets.split.map(&:to_i)
B = gets.split.map(&:to_i)
MOD = 998244353
dp = Array.new(N){ Array.new(3001, 0)}

dp0 = dp[0]
A[0].upto(B[0]) do |i|
  dp0[i] = 1
end

1.upto(N-1) do |n|
  dpb = dp[n-1]
  dpn = dp[n]
  a = A[n]
  b = B[n]
  ba = A[n-1]
  bb = B[n-1]
  sum = 0

  ba.upto(b) do |i|
    sum = sum + dpb[i] % MOD if i <= bb
    if i >= a
      dpn[i] = sum
    end
  end
end

puts dp[-1].sum % MOD