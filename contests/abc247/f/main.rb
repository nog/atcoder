N = gets.to_i
P = gets.split.map(&:to_i)
Q = gets.split.map(&:to_i)
result = 1
MOD = 998244353

def calc_fact(n)
  @finv = []
  @inv  = []
  @fact = []
  @finv[0] = @finv[1] = @inv[0] = @inv[1] = @fact[0] = @fact[1] = 1
  i = 2
  bfinv = 1
  while(i<=n) do
      @fact << @fact[-1] * i % MOD
      @inv  << inv   = @inv[MOD % i] * (MOD - MOD / i) % MOD
      @finv << bfinv = bfinv * inv % MOD
      i+=1
  end
end

def nCk(n, k)
  return 0 if k < 0 || k > n
  return 1 if k == 0 || k == n
  @fact[n] * ((@finv[k] * @finv[n-k]) % MOD) % MOD
end
calc_fact(N)

same = 0
rev = 0
hash = {}

N.times do |i|
  xp = P[i]
  xq = Q[i]
  same += 1 if xp == xq
  rev  += 1 if hash[xq] == xp
  hash[xp] = xq
end

revpat = 2.pow(rev, MOD)
n = N - same - (2 * rev)
(N-1).downto((N+1)/2) do |cnt|
  c = (revpat * nCk(n, cnt)) % MOD
  result = result + c % MOD
end

puts result % MOD