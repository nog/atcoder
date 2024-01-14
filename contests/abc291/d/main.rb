N = gets.to_i
MOD = 998244353
counts = [1,1]
ba, bb = gets.split.map(&:to_i)
1.upto(N-1) do |i|
  a, b = gets.split.map(&:to_i)
  counts = [
    (((ba != a) ? counts[0] : 0) + ((bb != a) ? counts[1] : 0)) % MOD,
    (((ba != b) ? counts[0] : 0) + ((bb != b) ? counts[1] : 0)) % MOD
  ]
  ba, bb = a, b
end

puts counts.sum % MOD