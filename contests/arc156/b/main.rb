N, K = gets.split.map(&:to_i)
A = gets.split.map(&:to_i)
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
calc_fact(2*(10**6))
hash = {}
A.each do |a|
  hash[a] = true
end

result = 0
min = 0
b = - 1
K.times do |k|
  while(hash[min]) do
    min += 1
  end
  x = K - k - 1
  (b+1).upto(min) do |m|
    # result = (result + ((m+1).pow(x, MOD))) % MOD
    result = (result + nCk(m+x, x)) % MOD
    # warn "m:#{m} b:#{b} result:#{result} x:#{x}"
  end
  # warn "min:#{min} b:#{b} result:#{result} x:#{x}"
  b = min
  hash[min] = true
end

puts result % MOD