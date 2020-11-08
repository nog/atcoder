A, B , C = gets.split.map(&:to_i)

MOD = 998244353
puts ( ((C + 1) * C / 2) * ((B + 1) * B / 2) * ((A + 1) * A / 2) ) % MOD