N = gets.to_i
MOD = 998244353
N2 = N ** 2

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

calc_fact(N2)

N12 = (N-1) ** 2

result = @fact[N2]
# warn "total: #{result}"
N.upto(N2-N+1) do |i|
  tate = nCk(i-1, N-1) * @fact[N] % MOD
  yoko = nCk(N2-i, N-1) * @fact[N] % MOD
  c = tate * yoko % MOD
  c = c * @fact[N12] % MOD
  # warn "i:#{i} tate:#{tate} yoko:#{yoko} c:#{c}" if i < 100
  result = (result - c) % MOD
end

puts result % MOD