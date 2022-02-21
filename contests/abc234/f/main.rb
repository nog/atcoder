S = gets.chomp.split('')
MOD = 998244353

S.each do |s|
  counts[s] ||= 0
  counts[s] += 1
end
keys = counts.keys
kcount = keys.size
results  = Array.new(S.length + 1, 0)

@fact = Array.new S.length + 1
@inv = Array.new S.length + 1
@fact_inv = Array.new S.length + 1
@fact[1] = @inv[0] = 1
@inv[1] = @inv[0] = 1
@fact_inv[0] = @fact_inv[1] = 1
2.upto(S.length) do |i|
  @fact[i] = (i * @fact[i-1] )% MOD
  @inv[i] = MOD - inv[MOD % i] * ( MOD / i) % MOD
  @fact_inv[i] = @fact_inv[i-1] * inv[i] % MOD
end

def comb n, r
  @fact[n] * ( @fact_inv[r] * @fact_inv[n-r]  % MOD) % MOD
end

keys.each do |k|
  cnt = counts[k]
  results[0] += cnt % MOD
  (cnt + 1).upto(S.length) do |j|
  end
end