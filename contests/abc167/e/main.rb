N, M, K = gets.split.map(&:to_i)
MOD = 998244353

result = 0

@fac = Array.new N+100
@inv = Array.new N+100
@finv = Array.new N+100

@fac[0] = @fac[1] = 1
@finv[0] = @finv[1] = 1
@inv[1] = 1

2.upto(N) do |i|
  @fac[i] = @fac[i-1] * i % MOD
  @inv[i] = (MOD - @inv[MOD % i] * (MOD / i)) % MOD
  @finv[i] = @finv[i - 1] * @inv[i] % MOD
end


def comb n, k
  raise if n < k 
  raise if n < 0 || k < 0
  return @fac[n] * (@finv[k] * @finv[n-k] % MOD ) % MOD
end

0.upto(K) do |k|
  result += M * comb(N-1, k) * (M-1).pow(N-1-k, MOD)
  result %= MOD
end

puts result