N , M = gets.split.map(&:to_i)
MOD = 998244353

keta = 0
keta_list = []
x = 1
while(x < M) do
  keta_list.push(keta)
  keta += 1
  x *= 2
end

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
calc_fact(2*(10**6))

warn "N:#{N} M:#{M} x:#{x} keta:#{keta}"

result = 0
max_counts = M - x + 1

def calc(keta, n)
  return 0 if keta < n
  res = 0
  (keta-1).down_to(n) do |k|
    res = res + calc(k, n-1) % MOD
  end
  return res
end

result = (max_count * calc(keta, N - 1) + calc(keta, N)) % MOD

puts result