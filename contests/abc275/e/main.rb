N, M, K = gets.split.map(&:to_i)
MOD = 998244353
dp = Array.new(K+1)
dp[0] = Array.new(N+1,0)
dp[0][0] = 1

K.times do |k|
  bd = dp[k]
  nd = Array.new(N+1, 0)
  nd[N] = bd[N] * M
  N.times do |n|
    bdn = bd[n]
    next if bdn == 0
    1.upto(M) do |m|
      if n+m <= N
        nd[n+m] = (nd[n+m] + bdn) % MOD
      else
        nd[2*N-n-m] = (nd[2*N-n-m] + bdn) % MOD
      end
    end
  end
  dp[k+1] = nd
end

def modinv(a)
  b = MOD
  u = 1
  v = 0
  while(b>0) do
    t = a / b
    a -= t * b
    b, a = a, b
    u -= t * v
    u, v = v, u
  end
  u %= MOD
  u += MOD if u < 0
  return u
end

puts (dp[K][N] * modinv(M.pow(K, MOD))) % MOD