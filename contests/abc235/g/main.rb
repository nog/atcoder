N, A, B, C = gets.split.map(&:to_i)
MOD = 998244353

_a, _b, _c = [A,B,C].sort.reverse

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

res = 0
_a.downto(0) do |a|
  kei = 1
  if _b > a
    b = a
    kei += 1
  else
    b = _b
  end

  if _c > a
    c = a
    kei += 1
  else
    c = _c
  end

  next if a + b + c < N
  result = @fact[N].pow(3, MOD)
  result = (result * @fact[a-b]) % MOD
  result = (result * @fact[a-c]) % MOD
  result = (result * @finv[a]) % MOD
  result = (result * @finv[a]) % MOD
  result = (result * @finv[a]) % MOD
  result = (result * @finv[N-a]) % MOD
  result = (result * @finv[N-b]) % MOD
  result = (result * @finv[N-c]) % MOD
  res = (res + (result * kei)) % MOD
end



puts res