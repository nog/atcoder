N, K = gets.split.map(&:to_i)
MOD = 998244353
hash = {
  1 => 1
}

x = 1
2.upto(N) do |i|
  bx = x
  x *= i
  d = x - bx
warn "i:#{i} d:#{d}"
  cnt = d / (i-1)
  2.upto(i) do |j|
    hash[j] ||= 0
    hash[j] = hash[j] + cnt % MOD
  end
end

result = 0
hash.each do |k, v|
  result = result + k.pow(K, MOD) * v % MOD
end

puts result % MOD