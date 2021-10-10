N = gets.to_i
MOD = 998244353

x_max = (N+1) / 2
x_max2 = (N+4) / 4

x_min = (N**(0.5)).to_i
result = (x_min * (1 + x_min) / 2) % MOD

k = 2
b_max = (N+1) / 2
while(true) do
  max = (N + (k**2)) / (2 * k)
  if max > x_min
    result = (result + (b_max - max) * (k - 1)) % MOD
  else
    result = (result + (b_max - x_min) * (k - 1)) % MOD
    break
  end
  b_max = max
  k += 1
end

puts result % MOD