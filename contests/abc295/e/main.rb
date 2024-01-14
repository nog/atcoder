N, M, K = gets.split.map(&:to_i)
A = gets.split.map(&:to_i)
MOD =998244353

def expected_value_after_operations(n, m, k, a)
  mod = 998_244_353

  # 組み合わせ計算用の階乗テーブルを作成
  fact = Array.new(n + 1)
  fact[0] = 1
  (1..n).each do |i|
    fact[i] = fact[i - 1] * i % mod
  end

  # 逆元の階乗テーブルを作成
  inv_fact = Array.new(n + 1)
  inv_fact[n] = fact[n].pow(mod - 2, mod)
  (1..n).reverse_each do |i|
    inv_fact[i - 1] = inv_fact[i] * i % mod
  end

  # 組み合わせを計算する関数
  def comb(n, k, fact, inv_fact, mod)
    return 0 if n < k || n < 0 || k < 0
    fact[n] * inv_fact[k] % mod * inv_fact[n - k] % mod
  end

  # 0の個数を数える
  zeros = a.count(0)

  # 期待値を計算
  ans = 0
  a.sort!
  (0...n).each do |i|
    next if a[i] == 0
    ans = (ans + a[i] * comb(n - zeros - 1, k - 1, fact, inv_fact, mod) % mod) % mod
  end
  ans = (ans * m.pow(zeros - 1, mod) % mod * inv_fact[zeros] % mod) % mod

  ans
end

puts expected_value_after_operations(N,M,K,A)