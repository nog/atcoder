R, G, B, K = gets.split.map(&:to_i)
MOD =998244353
r = R - K
g = G - K
b = B
rg = K

res = 0

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

n = g + b + rg
calc_fact(R+G+B)
gbrg = (@fact[n] * @finv[g] * @finv[b] * @finv[rg]) % MOD
res = gbrg * ((b + rg + 1).pow(r, MOD)) % MOD
puts res % MOD