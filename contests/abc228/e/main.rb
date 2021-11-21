N, K, M = gets.split.map(&:to_i)
MOD = 998244353
if M % MOD == 0
  puts 0
  exit
end
patterns =  K.pow(N, MOD-1)
puts M.pow(patterns, MOD)