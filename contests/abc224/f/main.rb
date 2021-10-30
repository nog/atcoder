S = gets.chomp
MOD = 998244353
len = S.length
result = 0
keisuu = 1
s = S.split('').map(&:to_i)
sum = 0
len.times do |i|
  x = s[i]
  keta = 10.pow(len-1-i,MOD)
  warn keta
  result = (result + (keisuu * x * keta)) % MOD
  result = (result + (sum * keta * keisuu / 2)) % MOD
  keisuu = (keisuu * 2) % MOD
  sum = sum + x % MOD
end

puts result % MOD