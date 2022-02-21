N = gets.to_i
MOD = 998244353
keta = 0
result = 0
while(N >= (min = 10**keta)) do
  max = (10**(keta+1)) - 1
  max = N if N < max
  sum = (- min + max + 2) * (max - min + 1) / 2
  result = (result + sum ) % MOD
  keta += 1
end

puts result