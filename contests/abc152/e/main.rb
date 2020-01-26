ARG_N = gets.to_i
ARG_A = gets.split.map(&:to_i)
MOD = 10**9+7

def modpow(a,n)
  res = 1
  while(n>0) do
    res = res * a % MOD if n & 1
    a = a * a % MOD
    n /= 2
  end
  res
end

def modinv(a)
  return modpow(a, MOD - 2)
end

lcm = 1
result = 0
ARG_A.each do |a|
  prev_lcm = lcm
  lcm = a.lcm(lcm)
  result = ((result * (lcm / prev_lcm)) + (lcm / a)) % MOD
end

puts result